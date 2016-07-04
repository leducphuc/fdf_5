class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :payment_method
      t.integer :cost
      t.datetime :paid_at
      t.boolean :is_paid

      t.timestamps null: false
    end
  end
end
