class FixDateColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :episodes, :date, :release_date
  end
end
