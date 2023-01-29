class Admin::QuotesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorizate_user
  before_action :set_quote, only: [:approve]

  def pending
    @pagy, @quotes = pagy(@quotes = Quote.where(state: 'pending'))
  end

  def approve
    @quote.approve!

    redirect_to admin_pending_quotes_path
  end

  private

  def set_quote
    @quote ||= Quote.find(params[:quote_id])
  end

  def authorizate_user
    return current_user.admin? || current_user.moderator?

    redirect_to root_path
  end
end
