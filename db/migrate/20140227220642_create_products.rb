class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user
      
      t.string :title
      t.integer :price
      
      t.timestamps
    end
    
    add_index :products, :user_id
  end
end
