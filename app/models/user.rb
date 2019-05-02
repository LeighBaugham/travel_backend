class User < ApplicationRecord
    has_secure_password
    has_many :passports
    has_many :trips, through: :passports
    has_many :trips

    validates :name, presence: true
    validates :password, presence: true

    def to_custom_json
        {
            name: self.name, 
            image_url: self.image_url,
            email: self.email,
            phone: self.phone,
            location: self.location,
            id: self.id

        }
    end

end
