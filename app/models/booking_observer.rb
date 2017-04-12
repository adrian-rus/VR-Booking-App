require 'my_logger'
class BookingObserver < ActiveRecord::Observer
    def after_update(record)
    # use the MyLogger instance method to retrieve the single instance/object 
        @logger = MyLogger.instance
    # use the logger to log/record a message about the updated booking
        @logger.logInformation("############### BookingObserver Demo:#")
        @logger.logInformation("+++ BookingObserver: The booking for #{record.date} #{record.time} has been updated. cost #{record.cost}")
        @logger.logInformation("##############################")
    end
end