class Account < ActiveRecord::Base
  has_one :user
  attr_accessor :verification_token, :remember_token
  before_create :create_verified_digest
  validates :username, presence: true, length: { maximum: 10 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def verified
    update_attribute(:verified, true)
    update_attribute(:verified, Time.zone.now)
  end

  def send_verification_email
    UserMailer.account_verification(self).deliver_now
  end

  def Account.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Account.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Account.new_token
    update_attribute(:remember_digest, Account.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticathed?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  :private

    def create_verified_digest
      self.verification_token  = Account.new_token
      self.verified_digest = Account.digest(verification_token)
    end
end
