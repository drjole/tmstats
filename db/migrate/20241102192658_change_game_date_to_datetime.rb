class ChangeGameDateToDatetime < ActiveRecord::Migration[8.0]
  def up
    change_column :games, :date, :datetime
    rename_column :games, :date, :time
  end

  def down
    rename_column :games, :time, :date
    change_column :games, :datetime, :date
  end
end
