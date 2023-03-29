# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book do
  subject { build(:book) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end
end
