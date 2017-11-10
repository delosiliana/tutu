class Carriage < ApplicationRecord
  belongs_to :train

  validate :number, :carriage_type
end
