class Route < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips

  has_many :stops
  has_many :highlights, through: :stops
end
