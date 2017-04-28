class CreateWellSymbols < ActiveRecord::Migration[5.0]
  def change
    create_table :well_symbols do |t|
      t.float :depth
      t.string :symbol
      t.references :well, foreign_key: true

      t.timestamps
    end
  end
end
