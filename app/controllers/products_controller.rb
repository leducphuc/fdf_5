class ProductsController < ApplicationController
  before_action :set_product, only: :show

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  private
  def set_product
    @product = Product.find params[:id]
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = t "product.set_product"
    redirect_to products_path
  end
end
