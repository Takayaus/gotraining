class RepliesController < ApplicationController
  def index
    @replies = Reply.all
  end

  def show
    @replies = Reply.find(params[:id])
  end

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      redirect_to reply_path
    else
      render :new
    end
  end

  def edit
    @reply = Ryply.find(params[:id])
  end

  def update
    @replies = Reply.find(params[:id])
    @reply.update(reply_params)
    if @reply.update(reply_params)
      redirect_to reply_path(@reply.id)
    else
      render :edit
    end
  end

  def destroy
  end

    private
  def reply_params
    params.require(:reply).permit(:content, :image)
  end

end
