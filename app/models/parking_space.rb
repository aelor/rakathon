class ParkingSpace < ApplicationRecord
	belongs_to :user
	acts_as_mappable :lat_column_name => :latitude,
                   :lng_column_name => :longitude

	def distance_from(cur_location)
		obj1 = cur_location
		obj2 = self.latitude, self.longitude
		distance = Owner.distance_between(obj1, obj2, :units => :kms, :formula => :sphere)
		distance.round(2)
	end
end
