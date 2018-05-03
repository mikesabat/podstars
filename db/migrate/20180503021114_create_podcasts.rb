class CreatePodcasts < ActiveRecord::Migration[5.1]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :host
      t.string :feed
      t.text :description
      t.string :homepage

      t.timestamps
    end
  end
end
