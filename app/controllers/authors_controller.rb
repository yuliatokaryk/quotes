class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
  end

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params.require(:author).permit(:first_name, :socond_name, :date_of_birth, :wikipedia_url, :goodreads_url))
    @author.user = current_user
    if @author.save
      flash[:notice] = "Author was saved"
      redirect_to authors_path
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    if @author.update(params.require(:author).permit(:first_name, :socond_name, :date_of_birth, :wikipedia_url, :goodreads_url))
      flash[:notice] = "Author was updated"
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
  end

end