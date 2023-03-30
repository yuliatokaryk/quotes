# frozen_string_literal: true

require 'rails_helper'

describe ProfilePolicy do
  subject { described_class }

  permissions :edit?, :update?, :destroy? do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:profile) { create(:profile, user: user1) }

    it 'denies access if user did not create a profile' do
      expect(subject).not_to permit(user2, profile)
    end

    it 'grants access if user not created a profile' do
      expect(subject).to permit(user1, profile)
    end
  end
end
