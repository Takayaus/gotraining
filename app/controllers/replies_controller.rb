class RepliesController < ApplicationController

  before_action :trainer_check

  def index
    @user = current_user
    @replies = @user.replies.all
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.create(content: reply_params[:content], post_id: reply_params[:post_id], user_id: current_user.id)
    @reply.post_id = params[:post_id]
    if @reply.save
      redirect_to "/posts/#{@reply.post.id}"
    else
      render :new
    end
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    @reply.update(reply_params)
    if  @reply.update(reply_params)
      redirect_to "/posts/#{@reply.post.id}"
    else
      render :edit
    end
  end

  def destroy
    reply = Reply.find(params[:id])
    reply.destroy
    redirect_to root_path
  end

    private
  def reply_params
    params.permit(:content, :image, :post_id)
  end

  def trainer_check
    user = current_user
    # if user.trainer_user.nil?
    # redirect_to root_path
    # end
    redirect_to root_path unless user.trainer_user
  end

end
