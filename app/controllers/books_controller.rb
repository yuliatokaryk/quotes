# frozen_string_literal: true

# Books Controller
class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :authorize_access

  def index
    @pagy, @books = pagy(Book.all)
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      flash[:notice] = t('.success')
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = t('.success')
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def authorize_access
    if @book.present?
      authorize @book
    else
      authorize Book
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :year_of_publication, :wikipedia_url, :goodreads_url, :author_id)
  end
end
