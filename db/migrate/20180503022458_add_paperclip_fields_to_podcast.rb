class AddPaperclipFieldsToPodcast < ActiveRecord::Migration[5.1]
  def change
  	add_column :podcasts, :image_file_name,    :string
    add_column :podcasts, :image_content_type, :string
    add_column :podcasts, :image_file_size,    :integer
    add_column :podcasts, :image_updated_at,   :datetime
  end
end
