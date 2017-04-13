class Booking < ActiveRecord::Base
    has_many :zones
    
    def self.search(search_for)
        Booking.where("lower(name) = ?", search_for.downcase)
    end
end
