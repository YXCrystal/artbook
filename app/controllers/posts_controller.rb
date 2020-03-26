class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = current_user.id
        if @post.save 
            flash[:notice] = "Successfully posted!"
            redirect_to '/profile'
        else 
            flash[:error] = "Something went wrong, please try again later."
            render 'new'
        end
    end

    def show
    end

    private 
    
    def post_params
        params.require(:post).permit(:body, :image)
    end
end
