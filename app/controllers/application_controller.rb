# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :require_profile

  include Pagy::Backend
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      books_path
    else
      super
    end
  end

  private

  def require_profile
    redirect_to new_profile_path if user_signed_in? && !current_user.profile && !devise_controller?
  end

  def user_not_authorized
    flash[:warning] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
