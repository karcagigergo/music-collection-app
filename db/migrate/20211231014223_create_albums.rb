class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :album_name
      t.integer :year
      t.string :artist
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
