class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def calc_posts(user)
    @posts_by_user = Post.includes(:user).where('user_id = ?', user.id).references(:user)
    user.posts_counter = @posts_by_user.length
    user.save
    @posts_by_user
  end
end
