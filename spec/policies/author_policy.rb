# frozen_string_literal: true

require 'rails_helper'

describe AuthorPolicy do
  subject { AuthorPolicy }

  permissions :edit?, :update?, :destroy? do
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }
    let(:author) { create(:author, user: user_1) }

    it 'denies access if user did not create a author' do
      expect(subject).not_to permit(user_2, author)
    end

    it 'grants access if user not created a author' do
      expect(subject).to permit(user_1, author)
    end
  end
end
