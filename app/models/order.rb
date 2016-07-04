class Order < ActiveRecord::Base
  has_many :product_orders, dependent: :destroy
  
  belongs_to :user
end
