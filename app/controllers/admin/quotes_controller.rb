# frozen_string_literal: true

module Admin
  # Admin Quotes Controller
  class QuotesController < Admin::BaseController
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
  end
end
