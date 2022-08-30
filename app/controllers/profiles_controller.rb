class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      flash[:notice] = "Profile was saved"
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = "Profile was updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end

  private

  def set_profile
    @profile = current_user.profile
  end 

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :nickname, :date_of_birth, :avatar)
  end

end
