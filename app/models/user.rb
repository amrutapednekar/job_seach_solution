class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :password_digest, presence: true 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates_uniqueness_of :email
    has_many :jobs, dependent: :destroy
    has_many :user_applied_jobs

end
