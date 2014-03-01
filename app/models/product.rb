class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  scope :published, where(published: true)

  validates :user, :category, :name, :brief, :descr, presence: true
  validates :price, presence: true, :numericality => {:greater_than => 4}

  before_create def set_defaults
    self.stock ||= 1
    self.public = true if self.public.nil?
    self.published = true if self.published.nil?
  end
end
