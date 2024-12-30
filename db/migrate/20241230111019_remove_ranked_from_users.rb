class RemoveRankedFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :ranked, :boolean, null: false, default: true
  end
end
