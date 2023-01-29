class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access

  def index
    @pagy, @authors = pagy(Author.all)
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    @author.user = current_user
    if @author.save
      flash[:notice] = t('.success')
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def update
    if @author.update(author_params)
      flash[:notice] = t('.success')
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def authorize_access
    if @author.present?
      authorize @author
    else
      authorize Author
    end
  end

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth, :wikipedia_url, :goodreads_url)
  end
end
