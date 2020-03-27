class UsersController < ApplicationController
    before_action :find_user, only: [:index, :show, :edit, :update]
    def index
        @user = User.find_by(id: current_user)
        @post = Post.new
        @posts = Post.all.where(user_id: current_user.id)
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
    end
    
    def edit
    end

    private

    def find_user
        @user = User.find_by(id: current_user.id)
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :birthday, :bio, :location, :avatar, :banner)
    end

end
