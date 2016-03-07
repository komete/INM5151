class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :nom,  presence: true, length: { maximum: 50 }
  validates :prenom,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  VALID_TELEPHONE_REGEX = /\A[0-9]{3}\-[0-9]{3}\-[0-9]{4}\z/i
  validates :telephone,  presence: true, format: {with: VALID_TELEPHONE_REGEX}
  validates :poste,  presence: true
  validates :codeEmploye,  presence: true, uniqueness: true
  validates :idCompte, presence: true
end
