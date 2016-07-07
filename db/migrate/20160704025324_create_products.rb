class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.string :picture_link
      t.float :price
      t.integer :classify
      t.integer :quantity
      t.float :rating
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
