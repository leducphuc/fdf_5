class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password_digest])
      log_in user
      flash[:success] = t "session.welcome"
      redirect_to root_url
    else
      flash.now[:danger] = t "session.error"
      render :new
    end
  end

  def destroy
    log_out
    flash[:danger] = t "session.goodbye"
    redirect_to root_url
  end
end
