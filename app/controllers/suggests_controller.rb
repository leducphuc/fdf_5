class SuggestsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def new
    @suggest = Suggest.new
  end

  def create
    @suggest = current_user.suggests.build suggest_params
    if @suggest.save
      flash[:success] = t "suggest.success"
      redirect_to new_suggest_path
    else
      flash.now[:danger] = t "suggest.fail"
      render :new
    end
  end

  private
  def suggest_params
    params.require(:suggest).permit :content
  end
end
