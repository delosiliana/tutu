class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def count_seats(type, seats_type)
    carriages.where(type: type).sum(seats_type)
  end

  def carriages_sort
    head_sort ? carriages.sort_up : carriages.sort_down
  end
end
