class CreateEpSearchCaches < ActiveRecord::Migration[5.1]
  def change
    create_table :ep_search_caches do |t|
      t.text :full_search

      t.timestamps
    end
    add_index :ep_search_caches, :star_id
  end
end
#would love to delete this entire model