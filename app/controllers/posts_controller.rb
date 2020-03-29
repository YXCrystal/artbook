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
        @post = Post.find(params[:id])
    end
    
    def like
        @post = Post.find(params[:id])
        type = params[:type].downcase
        if type == "like"
            current_user.likes << @post
            redirect_back(fallback_location: root_path, anchor: params[:anchor] )
        elsif type == "unlike"
            current_user.likes.delete(@post)
            redirect_back(fallback_location: root_path, anchor: params[:anchor] )
        end
    end

    private 
    
    def post_params
        params.require(:post).permit(:body, :image)
    end
end
