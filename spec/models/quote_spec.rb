require 'rails_helper'

RSpec.describe Quote, :type => :model do
  subject { build(:quote) }

  describe 'associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should belong_to(:book).without_validating_presence }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid when content has less that 20 characters' do
      subject.content = "Less than 20 char"
      expect(subject).to_not be_valid
    end

    it 'is not valid without content' do
      subject.content = ""
      expect(subject).to_not be_valid
    end
  end
end
