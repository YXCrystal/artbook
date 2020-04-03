class PostsController < ApplicationController

    def create
        @post = Post.create(post_params)
        @post.user_id = current_user.id
        if @post.save 
            flash[:notice] = "Successfully posted!"
            redirect_back(fallback_location: root_path)
        else 
            flash[:error] = "Something went wrong, please try again later."
            redirect_back(fallback_location: root_path)
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        @user = User.find_by(id: @post.user_id)
        @comment = Comment.new
        @comments = Comment.all.where(post_id: @post.id)
    end

    def edit
        @post = Post.find_by(id: params[:id])

        if @post.user_id == current_user.id
            @post = Post.find_by(id: params[:id])
        else 
            redirect_to @post
        end
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.user_id == current_user.id
            if @post.save 
                flash[:notice] = "Successfully updated post"
                redirect_to @post
            else 
                flash[:error] = "Unable to update post"
                redirect_to @post
            end
        else 
            redirect_to @post
        end
    end
    
    def like
        @post = Post.find(params[:id])
        type = params[:type].downcase
        if type == "like"
            current_user.likes << @post
            redirect_back(fallback_location: root_path, anchor: "#{@post.id}" )
        elsif type == "unlike"
            current_user.likes.delete(@post)
            redirect_back(fallback_location: root_path, anchor: "#{@post.id}" )
        end
    end

    def search
        if params[:search].blank?
            flash[:notice] = "Empty Field"
            redirect_back(fallback_location: root_path)
        else 
            @parameter = params[:search].downcase 
            @posts = Post.all.where("lower(body) LIKE :search", search: "%#{@parameter}%").order(created_at: :DESC)
        end
    end

    private 
    
    def post_params
        params.require(:post).permit(:body, :image)
    end
end
