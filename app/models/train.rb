class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation'
  belongs_to :route
  has_many :tickets

  validates :number, presence: true
end
