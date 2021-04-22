class AddNameEmailToArtistInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :artist_infos, :name, :string
    add_column :artist_infos, :email, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
