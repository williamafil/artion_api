class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :auction_id
      t.string :order_number
      t.integer :total_price, default: 0
      t.string :title
      t.string :billing_name
      t.string :billing_address
      t.string :shipping_name
      t.string :shipping_address
      t.string :is_paid, default: false
      t.timestamps
    end
  end
end
