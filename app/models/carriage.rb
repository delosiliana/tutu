class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  private

  def set_number
    self.number = if train.carriages.count.zero?
      1
    else
      train.carriages.last.number + 1
    end
  end
end
