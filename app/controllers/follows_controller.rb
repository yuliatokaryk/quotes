class FollowsController < ApplicationController
  before_action :set_follow, only: [:destroy]

  def create
    Follow.create(follower_id: current_user.id, following_id: params['following_id'])

    redirect_to(request.referrer || root_path)
  end

  def destroy
    @follow.destroy

    redirect_to(request.referrer || root_path)
  end

  private

  def set_follow
    @follow ||= Follow.find_by(follower_id: current_user.id, following_id: params['following_id'])
  end
end
