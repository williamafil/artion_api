class CreateArtistInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_infos do |t|
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
