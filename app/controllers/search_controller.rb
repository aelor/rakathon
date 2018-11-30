class SearchController < ApplicationController
  def index
  	lat = params[:lat] 
  	len = params[:lng] 
  	@search_records = Owner.within(5, :origin => [lat,len])
  	puts @search_records.inspect
  end

end
