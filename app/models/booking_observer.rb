require 'my_logger'
class BookingObserver < ActiveRecord::Observer
    def after_update(record)
    # use the MyLogger instance method to retrieve the single instance/object 
        @logger = MyLogger.instance
    # use the logger to log/record a message about the updated booking
        @logger.logInformation("############### BookingObserver Demo:#")
        @logger.logInformation("+++ BookingObserver: The booking for #{record.date.to_s} #{record.time.to_s} has been updated. The cost is now: #{record.cost}")
        @logger.logInformation("##############################")
    end
end