class AddStarIdToSearchCache < ActiveRecord::Migration[5.1]
  def change
    add_column :search_caches, :star_id, :integer
  end
end
