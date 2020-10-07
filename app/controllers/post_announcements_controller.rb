class PostAnnouncementsController < ApplicationController
  def index
    @post_announcements = PostAnnouncement.willpost
  end

  def show
    @post_announcement = PostAnnouncement.find(params[:id])
  end
end
