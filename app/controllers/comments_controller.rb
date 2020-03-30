class CommentsController < ApplicationController

    def new 
        @comment = Comment.new
    end

    def create
        @post = Post.find_by(id: params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.post_id = @post.id
        @comment.user_id = current_user.id
        if @comment.save
            flash[:notice] = "Comment successfully posted!"
            redirect_back(fallback_location: root_path, anchor: "#{@post.id}" )
        else 
            flash[:alert] = "Comment cannot be posted. Please try again"
            redirect_back(fallback_location: root_path, anchor: "#{@post.id}" )
        end
    end

    private 
    def comment_params
        params.require(:comment).permit(:body)
    end
end
