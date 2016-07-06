class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.string :piture_link
      t.integer :price
      t.integer :classify
      t.float :rating
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
