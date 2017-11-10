class Carriage < ApplicationRecord
  belongs_to :train

  validate :number, :upper_seats, :lower_seats, :carriage_type
end
