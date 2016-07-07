class Admin::ProductsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  before_action :find_product, only: [:edit, :update]
  before_action :load_products

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash.now[:notice] = t "product.create_notice"
      redirect_to @product
    else
      flash.now[:alert] = t "product.create_alert"
      render :new
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

  def load_products
    @categories = Category.all
    @product_selects =
      Product.classifies.map{|key, _| [I18n.t("classify.#{key}"), key]}
    @category_selects = @categories.collect{|cat| [cat.name, cat.id]}
  end
end
