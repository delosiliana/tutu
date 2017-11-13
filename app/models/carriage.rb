class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :ordered, -> { order(:number) }

  scope :sedentary, -> { where(type: 'SedentaryCarriage') }
  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :luxuru, -> { where(type: 'LuxuruCarriage') }

  private

  def set_number
    self.number = if train.carriages.count.zero?
      1
    else
      train.carriages.last.number + 1
    end
  end
end
