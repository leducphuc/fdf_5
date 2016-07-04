class CreateProductOrders < ActiveRecord::Migration
  def change
    create_table :product_orders do |t|
      t.references :order, index: true, foreign_key: true
      t.integer :number
      t.references :product, index: true, foreign_key: true
      t.integer :cost_product

      t.timestamps null: false
    end
  end
end
