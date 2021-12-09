# Posts controller
class PostsController < ApplicationController
  def index
    @user = User.where(id: params[:user_id]).includes(:posts).take
    # @user = User.find(params[:user_id])
    # @posts = @user.posts
  end

  def show
    # @user = User.find(params[:user_id])
    # @posts = @user.posts
    @post = Post.where(id: params[:id]).includes(:comments).take
    # @post = Post.find(params[:id])
  end

  def new
    @user = current_user
  end

  def create
    @post = current_user.posts.build(post_parameters)
    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
    else
      render :new
    end
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text)
  end
end
