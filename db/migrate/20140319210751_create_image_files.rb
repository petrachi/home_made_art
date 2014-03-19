class CreateImageFiles < ActiveRecord::Migration
  def change
    create_table :image_files do |t|
      t.references :imageable, polymorphic: true, index: true

      t.attachment :file
      t.string :file_fingerprint

      t.timestamps
    end
  end
end
