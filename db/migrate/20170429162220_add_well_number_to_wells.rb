class AddWellNumberToWells < ActiveRecord::Migration[5.0]
  def change
    add_column :wells, :well_number, :integer
  end
end
