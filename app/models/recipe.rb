class Recipe < ApplicationRecord
  MAX_TITLE_LENGTH = 100
  MIN_DESCRIPTION_LENGTH = 5
  MAX_DESCRIPTION_LENGTH = 1000

  has_many :instructions, dependent: :destroy, inverse_of: :recipe
  has_many :ingredients, dependent: :destroy, inverse_of: :recipe
  belongs_to :user, optional: true

  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
  validates :description, presence: true, length: { minimum: MIN_DESCRIPTION_LENGTH, maximum: MAX_DESCRIPTION_LENGTH }
end
