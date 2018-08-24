class AddLastSearchtoStars < ActiveRecord::Migration[5.1]
  def change
  	add_column :stars, :last_search, :datetime
  end
end
