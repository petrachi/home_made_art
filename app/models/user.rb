class User < ActiveRecord::Base
  has_many :products
  
  has_secure_password
  
  validates_presence_of :password, :on => :create
  validates_presence_of :name, :email
  validates_uniqueness_of :email
end