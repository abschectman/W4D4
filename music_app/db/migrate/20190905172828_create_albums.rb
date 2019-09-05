class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :year
      t.integer :band_id
      t.string :album_type
      t.timestamps
    end
  end
end
