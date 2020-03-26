class UsersController < ApplicationController
    def index
        @user = User.find_by(id: current_user)
        @post = Post.new
        @posts = Post.all
    end

    def show 
        @user = User.find_by(id: current_user)
    end
end
