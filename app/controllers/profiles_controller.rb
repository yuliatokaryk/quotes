class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access
  skip_before_action :require_profile, only: [:new, :create]

  def index
    @pagy, @profiles = pagy(Profile.where.not(user: current_user))
  end

  def show
    @quotes = Quote.where(state: 'approved', user: @profile.user)
    @quote = Quote.new
  end

  def new
    @profile = Profile.new
  end

  def edit
    @selected_country = @profile.country
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      flash[:notice] = t('.success')
      redirect_to root_path
    else
      redirect_to new_profile_path
    end
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = t('.success')
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  private

  def authorize_access
    if @profile.present?
      authorize @profile
    else
      authorize Profile
    end
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :nickname, :date_of_birth, :avatar, :country, :city, :number, :bio)
  end
end
