class UsersController < ApplicationController
    before_action :find_user, only: [:index, :show, :edit_header, :update]
    before_action :find_user_posts, only: [:index, :show]

    def index
        @user = User.find_by(id: current_user)
        @post = Post.new
    end

    def update
        if @user.update(user_params)
            flash.notice = "Profile has been updated"
            redirect_to user_path(current_user.id)
        else 
            redirect_to 'edit'
        end
    end

    def show
        @post = Post.new
    end
    
    def edit_header
    end

    private

    def find_user_posts
        @posts = Post.all.where(user_id: current_user.id).order(created_at: :DESC)
    end

    def find_user
        @user = User.find_by(id: current_user.id)
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :birthday, :bio, :location, :site, :avatar, :banner)
    end

end
