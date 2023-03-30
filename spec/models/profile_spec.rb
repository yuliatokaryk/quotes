# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile do
  subject { build(:profile) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a nickname' do
      subject.nickname = nil
      expect(subject).not_to be_valid
    end
  end
end
