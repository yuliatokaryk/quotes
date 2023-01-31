class QuotesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access

  def index
    @pagy, @quotes = pagy(Quote.where(state: 'approved'))
    @quotes = @quotes.order(created_at: :desc)
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.user = current_user
    
    if @quote.save
      flash[:notice] = t('.success')
      redirect_to quotes_path
    else
      render 'new'
    end
  end

  def update
    if @quote.update(quote_params)
      flash[:notice] = t('.success')
      redirect_to @quote
    else
      render 'edit'
    end
  end

  def destroy
    @quote.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def authorize_access
    if @quote.present?
      authorize @quote
    else
      authorize Quote
    end
  end

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:content, :source_string)
  end
end
