class User < ApplicationRecord
    has_secure_password
    has_many :passports
    has_many :trips, through: :passports

    validates :name, presence: true
    validates :password, presence: true

end
