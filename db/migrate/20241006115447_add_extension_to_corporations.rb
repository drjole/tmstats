class AddExtensionToCorporations < ActiveRecord::Migration[8.0]
  def change
    add_reference :corporations, :extension, null: false, foreign_key: true
  end
end
