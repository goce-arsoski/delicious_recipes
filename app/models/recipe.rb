class Recipe < ApplicationRecord
  has_many :instructions, inverse_of: :recipe
  accepts_nested_attributes_for :instructions, allow_destroy: true
end
