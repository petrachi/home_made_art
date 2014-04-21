class Article < ActiveRecord::Base
  belongs_to :user
  has_many :image_files, as: :imageable

  validates :user_id, presence: true

  scope :by_user, lambda { |user| where(user: user) }
  scope :published, lambda { where(published: true) }

  def self.get_by_user user_id, id
    find_by(user_id: user_id, id: id)
  end
end
