class Route < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips

  has_many :stops, dependent: :destroy
  has_many :highlights, through: :stops, dependent: :destroy
end
