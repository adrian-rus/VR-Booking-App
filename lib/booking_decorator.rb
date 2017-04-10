# the concrete component we would like to decorate, a booking in our example
class BasicBooking
    def initialize(cost, duration)
        @cost = cost
        @duration = duration
        @description = "Basic booking"
    end
    
    # getter methods
    def cost 
        return @cost
    end
    
    def duration
        return @duration
    end
    
    # a method which returns a string representation of the object of type BasicBooking
    def details
        return @description + " is set to: " + "#{@duration}" + " hour - at a cost of: €" + "#{@cost}"
    end
    
end # ends the BasicBooking class

# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class BookingDecorator < BasicBooking
    def initialize(basic_booking)
        #basic_booking is the default type of booking
        @basic_booking = basic_booking
        super(@basic_booking.cost, @basic_booking.duration)
        @extra_cost = 0
        @description = "No extra requests"
    end
    
    # override the cost method to include the cost of the extra feature	
    def cost        
        return @extra_cost + @basic_booking.cost
    end
    
    # override the details method to include the description of the extra feature
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_booking.details
    end
    
end # ends the BookingDecorator class


# a concrete decorator --  define an extra feature
class ActionZoneDecorator < BookingDecorator
    def initialize(basic_booking)
        super(basic_booking)
        @extra_cost = 200
        @description = "You booked zone A - Action Zone "
    end
    
end # ends the ActionZoneDecorator class


# another concrete decorator -- define an extra feature
class AdventureZoneDecorator < BookingDecorator
    def initialize(basic_booking)
        super(basic_booking)
        @extra_cost = 300
        @description = "You booked Zone B - Adventure Zone "
    end
    
end # ends the AdventureZoneDecorator class

class MultiplayerZoneDecorator < BookingDecorator
    def initialize(basic_booking)
        super(basic_booking)
        @extra_cost = 400
        @description = "You booked Zone C - Multiplayer Zone "
    end
    
end # ends the class

class SportsDecorator < BookingDecorator
    def initialize(basic_booking)
        super(basic_booking)
        @extra_cost = 500
        @description = "You booked Zone D - Sports Zone "
    end
    
end # ends the class


