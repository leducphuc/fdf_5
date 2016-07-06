class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:danger] = t "user.nil"
      redirect_to root_url
    end
  end
end
