class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }

  before_validation :set_number, on: :create

  scope :ordered, -> { order(:number) }

  scope :sedentary, -> { where(type: 'SedentaryCarriage') }
  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :luxury, -> { where(type: 'LuxuryCarriage') }

  private

  def set_number
    self.number = train.carriages.maximum(:number).to_i + 1
  end
end
