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
  end
end
