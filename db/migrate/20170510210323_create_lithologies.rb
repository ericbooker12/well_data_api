class CreateLithologies < ActiveRecord::Migration[5.0]
  def change
    create_table :lithologies do |t|
      t.float :depth
      t.float :felsite
      t.float :blueschist
      t.float :greenstone
      t.float :chert
      t.float :peridotite
      t.float :mum
      t.float :silicic_graywacke
      t.float :lithic_graywacke
      t.float :argillite
      t.float :serpentine
      t.float :clay
      t.float :blank
      t.references :well, foreign_key: true

      t.timestamps
    end
  end
end
