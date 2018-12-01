class ParkingsController < ApplicationController
  def show
    @parking = Parking.find(params[:id])
    @ps = @parking.parking_space
    @journey = @parking.journeys.first
    endT  = DateTime.now
    startT = @parking.journeys.first.started_at
    hours = (Time.parse(endT.to_s) - Time.parse(startT.to_s))/3600
    @total = (hours*100 + 100).round(2)
  end
end
