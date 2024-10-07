class AddUniqueIndexesToBoardsCorporationsAndExtensions < ActiveRecord::Migration[8.0]
  def change
    add_index :boards, :name, unique: true
    add_index :corporations, :name, unique: true
    add_index :extensions, :name, unique: true
  end
end
