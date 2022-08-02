require 'rails_helper'

RSpec.describe Author, :type => :model do
  subject { build(:author) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
  end
end
