class AddApiIdToEpisode < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :api_id, :string
  end
end
