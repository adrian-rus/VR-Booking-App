require 'booking_decorator'
require 'my_logger'
class BookingsController < ApplicationController
  
  #request authentication or registration
  before_filter :authenticate_user!
  before_filter :ensure_admin, :only => [:edit, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  
  def ensure_admin
    unless current_user && current_user.admin?
    render :text => "Access Error Message", :status => :unauthorized
    end
  end
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new()
    
    @booking.date = params[:booking][:date]
    @booking.time = params[:booking][:time]
   
    myBooking = BasicBooking.new(1, 100)
    if params[:booking][:party].to_s.length > 0 then
      myBooking = PartyDecorator.new(myBooking)
    end
    
    if params[:booking][:teambuild].to_s.length > 0 then
      myBooking = TeamBuildDecorator.new(myBooking)
    end
    
    @booking.cost = myBooking.cost
    @booking.description = myBooking.details
    
    logger = MyLogger.instance
    logger.logInformation("A new booking has been created on: " + @booking.date.to_s + @booking.description)
    
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    
    @booking.date = params[:booking][:date]
    @booking.time = params[:booking][:time]

     myBooking = BasicBooking.new(1, 100)
    if params[:booking][:party].to_s.length > 0 then
      myBooking = PartyDecorator.new(myBooking)
    end
    
    if params[:booking][:teambuild].to_s.length > 0 then
      myBooking = TeamBuildDecorator.new(myBooking)
    end
    
    @booking.cost = myBooking.cost
    @booking.description = myBooking.details
    
    updated_information = {
      'date' => @booking.date,
      'time' => @booking.time,
      'cost' => @booking.cost,
      'description' => @booking.description,
      'duration' => @booking.duration
    }
    respond_to do |format|
      if @booking.update(updated_information)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:date, :time, :duration, :description, :cost)
    end
end
