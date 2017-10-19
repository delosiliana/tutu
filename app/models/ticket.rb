class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', optional: true
  belongs_to :finish_station, class_name: 'RailwayStation', optional: true
end
