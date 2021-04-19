class AddSlugToAuctions < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :slug, :string
    add_index :auctions, :slug, unique: true
  end
end
