require 'rails_helper'

describe BookPolicy do
  subject { BookPolicy }

  permissions :edit?, :update?, :destroy? do
    
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }
    let(:book) { create(:book, user: user_1) }

    it "denies access if user did not create a book" do
      expect(subject).not_to permit(user_2, book)
    end

    it "grants access if user not created a book" do
      expect(subject).to permit(user_1, book)
    end

  end
end
