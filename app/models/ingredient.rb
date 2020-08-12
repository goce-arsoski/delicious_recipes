class Ingredient < ApplicationRecord
  belongs_to :recipe, optional: true
end
