# frozen_string_literal: true

require 'rails_helper'

describe AuthorPolicy do
  subject { described_class }

  permissions :edit?, :update?, :destroy? do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:author) { create(:author, user: user1) }

    it 'denies access if user did not create a author' do
      expect(subject).not_to permit(user2, author)
    end

    it 'grants access if user not created a author' do
      expect(subject).to permit(user1, author)
    end
  end
end
