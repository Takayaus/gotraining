class StaticpagesController < ApplicationController
  def home
    if user_signed_in?
    @post = current_user.posts.build
    @feed_posts = current_user.feed.paginate(page: params[:page])
    end
  end

  def contact
  end

  def about
  end

end
