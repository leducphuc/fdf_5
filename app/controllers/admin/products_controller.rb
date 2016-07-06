class Admin::ProductsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  before_action :find_product, only: [:edit, :update]
  before_action :load_product

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:notice] = t "product.create_notice"
      redirect_to @product
    else
      flash.now[:alert] = t "product.create_alert"
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update product_params
      flash[:notice] = t "product.update_notice"
      redirect_to @product
    else
      flash.now[:alert] = t "product.update_alert"
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit :name, :content, :picture_link, :price,
      :classify, :category_id, :quantity
  end

  def find_product
    @product = Product.find params[:id]
  end

  def load_product
    @categories = Category.all
    @product_select = Product.classifies.map{|key, _| [I18n.t("classify.#{key}"), key]}
    @category_select = @categories.collect{|cat| [cat.name, cat.id]}
  end
end
