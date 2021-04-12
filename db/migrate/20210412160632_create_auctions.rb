class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.integer :bidding_price
      t.integer :interval
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :is_active
      t.json :imgs
      t.integer :user_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
