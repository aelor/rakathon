class Parking < ApplicationRecord
  has_many :journeys
  belongs_to :parking_space
  belongs_to :user
end
