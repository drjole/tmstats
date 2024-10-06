class CreateCorporations < ActiveRecord::Migration[8.0]
  def change
    create_table :corporations do |t|
      t.string :name

      t.timestamps
    end
  end
end
