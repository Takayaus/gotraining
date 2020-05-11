class PostsController < ApplicationController

    def index
        @q = Post.includes(:gym).ransack(params[:q])
        @posts = @q.result(distinct: true)
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash.now[:success] = "投稿しました！"
            redirect_to root_url
        else
            @feed_posts = current_user.feed.paginate(page: params[:page])
            flash.now[:danger] = "投稿失敗しました。"
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

    def params_post_search
        params.permit(:search_gym, :search_title)
    end
end
