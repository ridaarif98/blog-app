class Api::CommentsController < ApplicationController
  load_and_authorize_resource
  def index
      @comment = Comment.where({post_id: params[:post_id]})
      render json: { success: true, message: 'Loaded all comments', data: { comment: @comment } }
  end

  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.create(comment_parameters.merge(user_id: current_user.id))
  #   if @comment.save
  #     render json: { success: true, message: 'Comment created', data: { comment: @comment } }
  #   else
  #     render json: {success: false, message: 'Not created'}      
  #   end
  # end


  # private

  # def comment_parameters
  #   params.require(:comment).permit(:text)
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:text], user: current_user)

    if @comment.save
      render json: { success: true, data: { comment: @comment } }, status: :created
    else
      render json: { success: false, errors: @comment.errors }, status: :bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
