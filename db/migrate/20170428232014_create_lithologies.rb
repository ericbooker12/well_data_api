class CreateLithologies < ActiveRecord::Migration[5.0]
  def change
    create_table :lithologies do |t|
      t.string :depth
      t.float :blank
      t.float :cement
      t.float :graywacke
      t.float :greenstone
      t.float :chert
      t.float :mum
      t.float :blueschist
      t.float :argillite
      t.float :serpentine
      t.float :clay
      t.float :peridotite
      t.references :well, foreign_key: true

      t.timestamps
    end
  end
end
