require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:recipe).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(Ingredient::MIN_NAME_LENGTH) }
    it { is_expected.to validate_length_of(:name).is_at_most(Ingredient::MAX_NAME_LENGTH) }
  end
end
