class ProfilesController < ApplicationController

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      flash[:alert] = "Profile was saved"
      redirect_to root_path
    else
      flash[:alert] = "Profile wasn't saved"
      render 'new'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :nickname, :date_of_birth, :avatar)
  end

end
