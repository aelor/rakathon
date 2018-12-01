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
    @parking = Parking.find(params[:parking])
    endT  = DateTime.now
    startT = @parking.journeys.first.started_at
    hours = (Time.parse(endT.to_s) - Time.parse(startT.to_s))/3600
    @total = (hours*100 + 100).round(2)
    payment_params = {}
    payment_params['embed'] = 'form'
    payment_params['data_amount'] = @total
    payment_params['data_readonly'] = 'data_amount'
    payment_params['data_email'] = current_user.email
    payment_params['data_phone'] = current_user.mobile

    uri = URI('https://test.instamojo.com/healthi/online-development/')
    uri.query = URI.encode_www_form(payment_params)
    @url =  uri.to_s

    redirect_to @url
  end

  def cancel_booking
  end

end
