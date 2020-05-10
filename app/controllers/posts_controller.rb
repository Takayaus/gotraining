class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to root_url
        else
            @feed_posts = current_user.feed.paginate(page: params[:page])
            render 'staticpages/home'
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        redirect_to root_url
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :gym_id)
    end
end
