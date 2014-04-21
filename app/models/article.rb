class Article < ActiveRecord::Base
  belongs_to :user
  has_many :image_files, as: :imageable

  validates :user, :title, presence: true
  validates :brief, :content, presence: true, if: :published

  scope :by_user, ->(user) { where(user: user) }
  scope :published, -> { where(published: true) }

  def self.get_by_user_id user_id, id
    find_by(user_id: user_id, id: id)
  end
end
