class CreateMineralogies < ActiveRecord::Migration[5.0]
  def change
    create_table :mineralogies do |t|
      t.float :depth
      t.float :quartz
      t.float :calcite
      t.float :pyrite
      t.float :pyrrhotite
      t.float :chloite
      t.float :axinite
      t.float :actinolite
      t.float :tourmaline
      t.references :well, foreign_key: true

      t.timestamps
    end
  end
end
