class CreateStars < ActiveRecord::Migration[5.1]
  def change
    create_table :stars do |t|
      t.string :name
      t.text :bio
      t.string :link

      t.timestamps
    end
  end
end
