class CommentsController < ApplicationController
   
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_parameters.merge(user_id: current_user.id))

        redirect_back(fallback_location: root_path)
    end
  
    private

    def comment_parameters
        params.require(:comment).permit(:text)
    end

end
  