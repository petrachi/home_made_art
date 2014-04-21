class User < ActiveRecord::Base
  has_many :products

  has_secure_password

  validates :password, presence: true, on: :create
  validates :name, presence: true, :email
  validates :email, uniqueness: true
end
