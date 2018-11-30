class SearchController < ApplicationController
  layout 'search'

  def index
  	lat = params[:lat] 
  	len = params[:lng] 
  	@search_records = Owner.within(5, :origin => [lat,len])
  end

end
