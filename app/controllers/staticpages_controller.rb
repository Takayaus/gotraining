class StaticpagesController < ApplicationController
  def home
    @post = current_user.posts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def contact
  end

  def about
  end
end
