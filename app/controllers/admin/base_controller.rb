class Admin::BaseController < ApplicationController
  before_action :authorize_user

  def authorize_user
    return if current_user.admin? || current_user.moderator?

    redirect_to root_path
  end
end
