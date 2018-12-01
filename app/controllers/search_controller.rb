class SearchController < ApplicationController
  layout 'search'

  def index
  	@lat = params[:lat] 
  	@len = params[:lng] 
  	@search_records = ParkingSpace.within(5,:units => :kms,:origin => [@lat,@len], :formula => :sphere)
  end

  def parking_lot
  end

  def stop_parking
  end

  def cancel_booking
  end

end
