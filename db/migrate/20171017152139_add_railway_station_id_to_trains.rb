class AddRailwayStationIdToTrains < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :trains, :railway_stations
  end
end
