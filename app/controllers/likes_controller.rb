class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, quote_id: params['quote_id'])

    redirect_to quotes_path(page: params['page'])
  end

  def destroy
    Like.where(user_id: current_user.id, quote_id: params['quote_id']).last.destroy

    redirect_to quotes_path(page: params['page'])
  end
end
