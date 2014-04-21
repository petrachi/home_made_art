class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :image_files, as: :imageable

  accepts_nested_attributes_for :image_files

  store_accessor :properties, :weight

  scope :published, where(published: true)

  validates :user, :category, :title, :brief, :descr, :weight, presence: true
  validates :price, presence: true, numericality: { greater_than: 4}

  before_create def set_defaults
    self.stock ||= 1
    self.public = true if self.public.nil?
    self.published = true if self.published.nil?
  end

  searchkick
end
