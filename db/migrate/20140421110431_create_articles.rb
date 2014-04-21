class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true

      t.string :title
      t.string :brief
      t.text :content
      
      t.boolean :published
      t.datetime :published_at

      t.timestamps
    end
  end
end
