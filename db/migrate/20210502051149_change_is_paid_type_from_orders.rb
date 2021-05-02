class ChangeIsPaidTypeFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :is_paid
    add_column :orders, :is_paid, :boolean, default: false
  end
end
