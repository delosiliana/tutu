class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route(route)&.update(position: position)
  end

  def position_in(route)
    station_route(route)&.position
  end

  def update_time(route, arrival, departure)
    station_route(route)&.update(arrival_time: arrival, departure_time: departure)
  end

  def time(route, type_time)
    time = station_route(route).try(type_time)
    time&.strftime('%H:%M')
  end


  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.find_by(route: route)
  end
end
