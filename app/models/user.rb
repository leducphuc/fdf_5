class User < ActiveRecord::Base
  has_many :suggests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_secure_password

  def current_user? user
    self == user
  end  
end
