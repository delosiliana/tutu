class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def count_seats(carriages_type, seats_type)
    carriages.where(type: carriages_type).sum(seats_type)
  end

  def sorted_carriages
    head_sort ? carriages.order(number: :asc) : carriages.order(number: :desc)
  end
end
