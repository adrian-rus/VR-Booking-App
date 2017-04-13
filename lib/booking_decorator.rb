# the concrete component we would like to decorate, a booking in our example
class BasicBooking
    def initialize(d, c)
        @duration = d
        @cost = c
        @description = " basic booking"
    end
    
    # getter methods
    def duration
        return @duration
    end
    
    def cost
        return @cost
    end
    
    # a method which returns a string representation of the object of type BasicBooking
    def details
        return @description + "; is set to: " + "#{@duration}" + "hour - at a cost of: " + "#{@cost}"
    end
    
end # ends the BasicBooking class

# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class BookingDecorator < BasicBooking
    def initialize(basic_booking)
        #basic_booking is the default type of booking
        @basic_booking = basic_booking
        super(@basic_booking.duration, @basic_booking.cost)
        @extra_cost = 0
        @description = "no extra requests"
    end
    
    # override the cost method to include the cost of the extra feature	
    def cost        
        return @extra_cost + @basic_booking.cost
    end
    
    # override the details method to include the description of the extra feature
    def details
        return  @description + " extra cost: " + "#{@extra_cost}" + ". " + @basic_booking.details
    end
    
end # ends the BookingDecorator class


# a concrete decorator --  define an extra feature
class FpsDecorator < BookingDecorator
    def initialize(basic_booking)
        super(basic_booking)
        @extra_cost = 200
        @description = " This is going to be the most immersive FPS you have ever experienced."
    end
    
end # ends the PartyDecorator class


# another concrete decorator -- define an extra feature
class TeamBuildDecorator < BookingDecorator
    def initialize(basic_booking)
        super(basic_booking)
        @extra_cost = 400
        @description = " Teamwork and Leadership are key to the games here. "
    end
    
end # ends the TeamBuildDecorator class