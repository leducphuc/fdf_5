class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:danger] = t "user.nil"
      redirect_to admin_users_path
    end
    if @user.is_admin?
      flash[:danger] = t "user.no" 
      redirect_to admin_users_path
    end
    if @user.destroy
      flash[:success] = t "user.destroy"
      redirect_to admin_users_path
    end
  end   
end
