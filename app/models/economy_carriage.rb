class EconomyCarriage < Carriage
  validates :side_upper_seats, :side_lower_seats, :upper_seats, :lower_seats, presence: true
end
