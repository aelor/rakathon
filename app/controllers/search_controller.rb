class SearchController < ApplicationController
  layout 'search'

  def index
  	@lat = params[:lat] 
  	@len = params[:lng] 
  	@search_records = Owner.within(5,:units => :kms,:origin => [@lat,@len], :formula => :sphere)
  end

end
