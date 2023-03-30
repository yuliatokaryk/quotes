# frozen_string_literal: true

require 'rails_helper'

describe BookPolicy do
  subject { described_class }

  permissions :edit?, :update?, :destroy? do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:book) { create(:book, user: user1) }

    it 'denies access if user did not create a book' do
      expect(subject).not_to permit(user2, book)
    end

    it 'grants access if user not created a book' do
      expect(subject).to permit(user_1, book)
    end
  end
end
