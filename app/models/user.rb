class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :password_digest, presence: true 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates_uniqueness_of :email
end
