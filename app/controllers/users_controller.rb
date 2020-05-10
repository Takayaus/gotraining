class UsersController < ApplicationController
    def index
        @users = User.paginate(page: params[:page])
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts.paginate(page: params[:page])
    end

    def following
        @title = "Following"
        @user  = User.find(params[:id])
        render 'show_following'
      end
    
      def followers
        @title = "Followers"
        @user  = User.find(params[:id])
        render 'show_follower'
      end

end
