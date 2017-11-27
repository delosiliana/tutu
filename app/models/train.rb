class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  scope :station_on_route, -> (station) { joins(route: :railway_stations).where("railway_station_id = ?", station) }

  def count_seats(carriages_type, seats_type)
    carriages.where(type: carriages_type).sum(seats_type)
  end

  def sorted_carriages
    head_sort ? carriages.order(number: :asc) : carriages.order(number: :desc)
  end

  def self.search(start_station, finish_station)
    Train.station_on_route(start_station) & Train.station_on_route(finish_station)
  end
end
