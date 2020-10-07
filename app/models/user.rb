class User < ApplicationRecord
    has_many :tweets, dependent: :destroy
    has_one :profile, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :relationships
    
    has_secure_password
    
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 250},
                format: { with: VALID_EMAIL_REGEX }, 
                uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: { minimum: 8 }
    
end
