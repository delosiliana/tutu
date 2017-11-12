class CoupeCarriage < Carriage
  validates :upper_seats, :lower_seats, presence: true
end
