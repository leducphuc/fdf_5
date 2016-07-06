class Product < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :product_orders, dependent: :destroy

  belongs_to :category

  enum classify: [:food, :drink]

  validates :name, presence: true, length: {in: 6..50}
  validates :content, presence: true, length: {minimum: 50}
  validates :picture_link, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.5}
  validates :quantity, presence: true, numericality: {only_integer: true}
end
