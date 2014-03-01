class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user
      t.references :category

      t.string :name
      t.string :brief
      t.text :descr

      t.integer :price
      t.integer :stock

      t.boolean :public
      t.boolean :published

      t.timestamps
    end

    add_index :products, :user_id
    add_index :products, :category_id
  end
end
