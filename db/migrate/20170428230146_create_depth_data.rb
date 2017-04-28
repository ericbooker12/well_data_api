class CreateDepthData < ActiveRecord::Migration[5.0]
  def change
    create_table :depth_data do |t|
      t.float :depth
      t.float :rop
      t.float :wob
      t.float :temp_in
      t.float :temp_out
      t.float :pressure
      t.references :well, foreign_key: true

      t.timestamps
    end
  end
end
