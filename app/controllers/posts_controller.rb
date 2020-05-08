class PostsController < ApplicationController
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to root_url
        else
            render 'staticpages/home'
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :content, :gym_id)
    end
end
