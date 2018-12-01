module OwnersHelper

def get_distance(cur_location,lat, len)
  obj1 = cur_location
  obj2 = lat,len
  distance = Owner.distance_between(obj1, obj2, :units => :kms, :formula => :sphere)
  return distance.round(2)

end

end
