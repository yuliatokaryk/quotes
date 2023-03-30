# frozen_string_literal: true

require 'rails_helper'

describe QuotePolicy do
  subject { described_class }

  permissions :edit?, :update?, :destroy? do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:quote) { create(:quote, user: user1) }

    it 'denies access if user did not create a quote' do
      expect(subject).not_to permit(user2, quote)
    end

    it 'grants access if user not created a quote' do
      expect(subject).to permit(user1, quote)
    end
  end
end
