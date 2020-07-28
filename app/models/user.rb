class User < ApplicationRecord
  scope :within, -> (latitude, longitude, distance_in_km = 1) {
    where(%{
     ST_Distance(location, 'POINT(%f %f)') < %d
    } % [longitude, latitude, distance_in_km.to_i * 1000]) # approx
  }
end
