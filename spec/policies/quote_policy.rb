# frozen_string_literal: true

require 'rails_helper'

describe QuotePolicy do
  subject { QuotePolicy }

  permissions :edit?, :update?, :destroy? do
    
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }
    let(:quote) { create(:quote, user: user_1) }

    it 'denies access if user did not create a quote' do
      expect(subject).not_to permit(user_2, quote)
    end

    it 'grants access if user not created a quote' do
      expect(subject).to permit(user_1, quote)
    end
  end
end
