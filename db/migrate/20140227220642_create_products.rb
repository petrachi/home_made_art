class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user, index: true
      t.references :category, index: true

      t.string :title
      t.string :brief
      t.text :descr
      t.hstore :properties

      t.integer :price
      t.integer :stock

      t.boolean :public
      t.boolean :published

      t.timestamps
    end
  end
end
