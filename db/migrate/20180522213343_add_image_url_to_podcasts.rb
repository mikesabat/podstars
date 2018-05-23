class AddImageUrlToPodcasts < ActiveRecord::Migration[5.1]
  def change
    add_column :podcasts, :image_url, :string
  end
end
