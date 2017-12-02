class Ticket < ApplicationRecord
  #belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :finish_station, class_name: 'RailwayStation', foreign_key: :finish_station_id
  belongs_to :train

  validates :passenger_name, :passenger_lastname, :passenger_patronymic, :passport_number, :passport_series, presence: true

end
