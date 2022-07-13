class User < ApplicationRecord
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
    validates :password, presence: true
    
end
