class UsersController < ApplicationController
    before_action :find_user, only: [:index, :show, :edit]
    def index
        @user = User.find_by(id: current_user)
        @post = Post.new
        @posts = Post.all
    end

    def show 
    end
    
    def edit
    end

    private

    def find_user
        @user = User.find_by(id: current_user)
    end

end
