class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  scope :train_on_route, -> (id) { joins(route: :railway_stations).where("railway_station_id = ?", id) }

  def count_seats(carriages_type, seats_type)
    carriages.where(type: carriages_type).sum(seats_type)
  end

  def sorted_carriages
    head_sort ? carriages.order(number: :asc) : carriages.order(number: :desc)
  end

  def self.search_by_stations(start_station, finish_station)
    Train.train_on_route(start_station) & Train.train_on_route(finish_station)
  end
end
