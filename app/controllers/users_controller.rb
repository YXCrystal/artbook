class UsersController < ApplicationController
    def index
        @user = User.find_by(id: current_user)
        @post = Post.new
        @posts = Post.all
    end
end
