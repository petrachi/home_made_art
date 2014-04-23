class User < ActiveRecord::Base
  has_many :products

  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def self.get_by_id id
    find_by(id: id)
  end
end
