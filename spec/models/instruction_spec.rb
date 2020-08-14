require 'rails_helper'

RSpec.describe Instruction do
  describe 'associations' do
    it { is_expected.to belong_to(:recipe).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:step) }
    it { is_expected.to validate_length_of(:step).is_at_least(Instruction::MIN_STEP_LENGTH) }
    it { is_expected.to validate_length_of(:step).is_at_most(Instruction::MAX_STEP_LENGTH) }
  end
end
