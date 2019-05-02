class Passport < ApplicationRecord

    belongs_to :user, :dependent => :destroy
    belongs_to :trip, :dependent => :destroy
    
end
