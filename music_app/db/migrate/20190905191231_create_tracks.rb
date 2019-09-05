class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :album_id
      t.integer :ord
      t.text :lyrics
      t.timestamps
    end
  end
end
