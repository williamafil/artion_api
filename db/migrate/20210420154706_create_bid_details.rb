class CreateBidDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :bid_details do |t|
      t.integer :user_id
      t.integer :auction_id
      t.integer :bid

      t.timestamps
    end
  end
end
