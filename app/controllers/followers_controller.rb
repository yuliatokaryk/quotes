class FollowersController < ApplicationController
  before_action :set_following, only: [:destroy]
  before_action :set_follower, only: [:destroy]

  def create
    Follower.create(user_id: current_user.id, follower_id: params['user_id'])
    Following.create(user_id: params['user_id'], following_id: current_user.id)

    redirect_to(request.referrer || root_path)
  end

  def destroy
    @follower.destroy
    @following.destroy

    redirect_to(request.referrer || root_path)
  end

  private

  def set_follower
    @follower ||= Follower.find_by(user_id: current_user.id, follower_id: params['user_id'])
  end

  def set_following
    @following ||= Following.find_by(user_id: params['user_id'], following_id: current_user.id)
  end
end
