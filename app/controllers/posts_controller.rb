# Posts controller
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    # @user = User.find(params[:user_id])
    # @posts = @user.posts
    @post = Post.find(params[:id])
  end
end
