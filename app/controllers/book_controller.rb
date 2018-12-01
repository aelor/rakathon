class BookController < ApplicationController
  before_action :authenticate_user!

  def parking
    @ps = ParkingSpace.find(params[:parking_space_id])
    @latlng = params[:lat], params[:lng]
    ActiveRecord::Base.transaction do
      @parking = Parking.create(user_id: current_user.id, parking_space_id: @ps.id, in_time: DateTime.now, status: "booked")
      @journey = Journey.create(parking_id: @parking.id, from_lat: @latlng[0], from_lng: @latlng[1], to_lat: @ps.latitude, to_lng: @ps.longitude, started_at: DateTime.now)
    end

    redirect_to parking_path(@parking)
  end
end
