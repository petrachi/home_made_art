class ImageFile < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :file,
    styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }

  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

end
