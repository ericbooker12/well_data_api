class RemoveWellNumberToWells < ActiveRecord::Migration[5.0]
  def change
    remove_column :wells, :well_number, :string
  end
end
