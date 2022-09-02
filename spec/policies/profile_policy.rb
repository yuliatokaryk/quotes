require 'rails_helper'

describe ProfilePolicy do
  subject { ProfilePolicy }

  permissions :edit?, :update?, :destroy? do
    
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }
    let(:profile) { create(:profile, user: user_1) }

    it "denies access if user did not create a profile" do
      expect(subject).not_to permit(user_2, profile)
    end

    it "grants access if user not created a profile" do
      expect(subject).to permit(user_1, profile)
    end

  end
end
