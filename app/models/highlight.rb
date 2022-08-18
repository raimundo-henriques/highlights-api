class Highlight < ApplicationRecord
  has_many :stops
  has_many :routes, through: :stops
end
