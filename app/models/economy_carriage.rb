class EconomyCarriage < Carriage
  validates :side_upper_seats, :side_lower_seats, presence: true
end
