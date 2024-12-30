class AddRankedToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :ranked, :boolean, null: false, default: true
  end
end
