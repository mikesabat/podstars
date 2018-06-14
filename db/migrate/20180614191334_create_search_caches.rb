class CreateSearchCaches < ActiveRecord::Migration[5.1]
  def change
    create_table :search_caches do |t|
      t.text :search

      t.timestamps
    end
  end
end
