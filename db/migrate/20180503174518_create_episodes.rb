class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.integer :star_id
      t.integer :podcast_id

      t.timestamps
    end
    add_index :episodes, :star_id
    add_index :episodes, :podcast_id
    # add_index :episodes, [:star_id, :podcast_id], unique: true
    # A star might be on a podcast multiple times and we'd want to list both. Pulled this out of the Hartl code.
  end
end
