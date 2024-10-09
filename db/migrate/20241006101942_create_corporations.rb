class CreateCorporations < ActiveRecord::Migration[8.0]
  def change
    create_table :corporations do |t|
      t.string :name, null: false, index: {unique: true}

      t.references :extension, null: false, foreign_key: true

      t.timestamps
    end
  end
end
