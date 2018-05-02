class AddPaperclipFieldsToStar < ActiveRecord::Migration[5.1]
  def change
  	add_column :stars, :image_file_name,    :string
    add_column :stars, :image_content_type, :string
    add_column :stars, :image_file_size,    :integer
    add_column :stars, :image_updated_at,   :datetime
  end
end
