class Owner < ApplicationRecord
	acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude
end