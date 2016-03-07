class Account < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 10 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end
