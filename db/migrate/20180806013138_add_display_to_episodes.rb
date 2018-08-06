class AddDisplayToEpisodes < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :display, :boolean
  end
end
