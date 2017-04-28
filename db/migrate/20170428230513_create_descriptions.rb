class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.float :depth
      t.text :content
      t.references :well, foreign_key: true

      t.timestamps
    end
  end
end
