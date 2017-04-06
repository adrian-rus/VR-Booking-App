class ZonesController < ApplicationController
  
  #GET /bookings/1/zones
  def index
    @booking = Booking.find(params[:booking_id])
    @zones = @booking.zones
  end

  # GET /bookings/1/zones/2
  def show
    @booking = Booking.find(params[:booking_id])
    @zone = @booking.zones.find(params[:id])
  end
  
  # GET /bookings/1/zones/new
  def new
    @booking = Booking.find(params[:booking_id])
    @zone = @booking.zones.build
  end
  
  #POST /bookings/1/zone
  def create
    @booking = Booking.find(params[:booking_id])
    @zone = @booking.zones.build(params.require(:zone).permit!)
    @zone = @booking.zones.build(params.require(:zone).permit(:name, :description))
    if @zone.save
      redirect_to booking_zone_url(@booking, @zone)
    else
      render :action => "new"
    end
  end

  # GET /bookings/1/zones/2/edit
  def edit
     @booking = Booking.find(params[:booking_id])
     @zone = @booking.zones.find(params[:id])
  end
  
  #PUT /bookings/1/reviews/2
  def update
    @booking = Booking.find(params[:booking_id])
    @zone = Zone.find(params[:id])
    if @zone.update_attributes(params.require(:zone).permit(:name, :description))
      redirect_to booking_zone_url(@booking, @zone)
    else
      render :action => "edit"
    end
  end
  
  #DELETE /bookings/1/zones/2
  def destroy 
    @booking = Booking.find(params[:booking_id])
    @zone = Zone.find(params[:id])
    @zone.destroy
    
    respond_to do |format|
      format.html {redirect_to booking_zone_path(@booking)}
      format.xml {head :ok}
    end
  end
end
