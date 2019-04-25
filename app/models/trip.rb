class Trip < ApplicationRecord

    has_many :passports
    has_many :users, through: :passports

end
