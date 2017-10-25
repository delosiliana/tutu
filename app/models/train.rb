class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true #пока для тестов потом уберу
  belongs_to :route, optional: true #пока для тестов потом уберу
  has_many :tickets

  validates :number, presence: true
end
