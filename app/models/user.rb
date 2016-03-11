class User < ActiveRecord::Base
  attr_accessor :verification_token, :remember_token, :reset_token
  before_create :create_verified_digest
  before_save :convertir_email
  validates :username, presence: true, length: { maximum: 10 }, uniqueness: {case_sensitive: true}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :nom,  presence: true, length: { maximum: 50 }
  validates :prenom,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  VALID_TELEPHONE_REGEX = /\A[0-9]{3}\-[0-9]{3}\-[0-9]{4}\z/i
  validates :telephone,  presence: true, format: {with: VALID_TELEPHONE_REGEX}
  validates :poste,  presence: true
  validates :codeEmploye,  presence: {scope: true, message: "Doit être saisit"}, uniqueness: true

  def verified
    update_attribute(:verified, true)
    update_attribute(:verified, Time.zone.now)
    self.create_verified_digest
  end

  def verified?
    return self.verified unless self.verified.nil?
  end

  def send_verification_email
    AccountMailer.account_verification(self).deliver_now
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticathed?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_at, Time.zone.now)
  end

  def send_password_reset_email
    AccountMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_at < 2.hours.ago
  end

  :private

    def convertir_email
      self.email = email.downcase
    end

    def create_verified_digest
      self.verification_token  = User.new_token
      self.verified_digest = User.digest(verification_token)
    end
end
