class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private 
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "application.force_login"
      redirect_to login_url
    end
  end
  
  def admin_user
    redirect_to root_url unless current_user.is_admin?
  end

  def correct_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:danger] = t "user.nil"
      redirect_to root_url
    end
    redirect_to root_url unless current_user.current_user? @user
  end
end
