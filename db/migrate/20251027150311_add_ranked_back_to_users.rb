class AddRankedBackToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :ranked, :boolean, null: false, default: true
  end
end
