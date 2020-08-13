class Instruction < ApplicationRecord
  MIN_STEP_LENGTH = 2
  MAX_STEP_LENGTH = 50

  belongs_to :recipe, optional: true

  validates :step, presence: true, length: { minimum: MIN_STEP_LENGTH, maximum: MAX_STEP_LENGTH }
end
