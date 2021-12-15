# Posts controller
class PostsController < ApplicationController
  def index
    # @user = User.where(id: params[:user_id]).includes(:posts).take
    if params[:user_id]
      @user = User.find(params[:user_id])
      calc_posts(@user)
    else
      @posts_by_user = Post.all
      render 'allposts'
    end
  end

  def show
    @post = Post.where(id: params[:id]).includes(:comments).take
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_parameters)
    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    flash[:success] = 'Post was successfully created.'
    redirect_to user_posts_path(current_user.id)
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text, :user_id)
  end
end
