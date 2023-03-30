# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author do
  subject { build(:author) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a first_name' do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end
  end

  describe 'full_name' do
    it 'returns first name and last name of the author' do
      expect(subject.full_name).to eq("#{subject.first_name} #{subject.last_name}")
    end
  end
end
