class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def carriages_count(carriage_type)
    carriages.where(carriage_type: carriage_type).count
  end

  def upper_seats_count(carriage_type)
    carriages.where(carriage_type: carriage_type).sum('upper_seats')
  end

  def lower_seats_count(carriage_type)
    carriages.where(carriage_type: carriage_type).sum('lower_seats')
  end
end
