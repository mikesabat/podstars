class AddDateToEpisodes < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :date, :date
  end
end
