class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
end
