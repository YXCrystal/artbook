class UsersController < ApplicationController
    before_action :find_other_user, only: [:show]
    before_action :find_user, except: [:show]
    before_action :find_user_posts, except: [:show]
    before_action :new_post, only: [:show, :edit_header, :edit_info]

    def index
        @user = User.find_by(id: current_user)
        @post = Post.new
    end

    def artist
        @user = User.find(params[:id])
    end

    def update
        if @user.update(user_params)
            flash.notice = "Profile has been updated"
            redirect_to user_path(current_user.id)
        else
            flash.notice = "Profile cannot be updated"
            redirect_to user_path(current_user.id)
        end
    end

    def show
        @posts = Post.all.where(user_id: params[:id]).order(created_at: :DESC)
    end
    
    def edit_header
    end

    def edit_info
    end

    def photos
    end

    def about
    end

    private

    def find_other_user
        @user = User.find(params[:id])
    end

    def new_post
        @post = Post.new
    end

    def find_user_posts
        @posts = Post.all.where(user_id: current_user.id).order(created_at: :DESC)
    end

    def find_user
        @user = User.find_by(id: current_user.id)
    end

    def user_params
        params.permit(:first_name, :last_name, :birthday, :bio, :location, :site, :avatar, :banner)
    end

end
