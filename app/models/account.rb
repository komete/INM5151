class Account < ActiveRecord::Base
  attr_accessor :verification_token
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
  :private

    def create_verified_digest
      self.verification_token  = Account.new_token
      self.verified_digest = Account.digest(verification_token)
    end
end
