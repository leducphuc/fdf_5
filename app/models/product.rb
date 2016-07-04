class Product < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :product_orders, dependent: :destroy
  
  belongs_to :category
end
