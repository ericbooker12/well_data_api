class RemoveMineralFomMineralogies < ActiveRecord::Migration[5.0]
  def change
  	remove_column :mineralogies, :chloite, :float
  	add_column :mineralogies, :chlorite, :integer
  end
end
