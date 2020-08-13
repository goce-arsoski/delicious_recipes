class Recipe < ApplicationRecord
  MAX_TITLE_LENGTH = 100
  MIN_DESCRIPTION_LENGTH = 5
  MAX_DESCRIPTION_LENGTH = 1000
  MIN_STEP_LENGTH = 3
  MAX_STEP_LENGTH = 500
  MIN_NAME_LENGTH = 2
  MAX_NAME_LENGTH = 50

  has_many :instructions, dependent: :destroy, inverse_of: :recipe
  has_many :ingredients, dependent: :destroy, inverse_of: :recipe
  belongs_to :user, optional: true

  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
  validates :description, presence: true, length: { minimum: MIN_DESCRIPTION_LENGTH, maximum: MAX_DESCRIPTION_LENGTH }
  validates_length_of :instructions, minimum: MIN_STEP_LENGTH, maximum: MAX_STEP_LENGTH, allow_blank: true
  validates_length_of :ingredients, minimum: MIN_NAME_LENGTH, maximum: MAX_NAME_LENGTH, allow_blank: true
end
