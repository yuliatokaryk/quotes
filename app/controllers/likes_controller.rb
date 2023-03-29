# frozen_string_literal: true

# Likes Controller
class LikesController < ApplicationController
  before_action :like, only: [:destroy]

  def create
    Like.create(user_id: current_user.id, quote_id: params['quote_id'])

    redirect_to(request.referrer || root_path)
  end

  def destroy
    @like.destroy

    redirect_to(request.referrer || root_path)
  end

  private

  def like
    @like ||= Like.find_by(user_id: current_user.id, quote_id: params['quote_id'])
  end
end
