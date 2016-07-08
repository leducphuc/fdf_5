class Admin::SuggestsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  
  def show
    @suggests = Suggest.desc_created_at.paginate page: params[:page]
  end
end
