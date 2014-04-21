class User < ActiveRecord::Base
  has_many :products

  has_secure_password

  validates :password, presence: true, on: :create
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
