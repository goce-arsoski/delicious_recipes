class Ingredient < ApplicationRecord
  MIN_NAME_LENGTH = 2
  MAX_NAME_LENGTH = 100

  belongs_to :recipe, optional: true

  validates :name, presence: true, length: { minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH }
end
