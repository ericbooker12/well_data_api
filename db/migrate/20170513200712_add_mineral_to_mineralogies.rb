class AddMineralToMineralogies < ActiveRecord::Migration[5.0]
  def change
  	change_table :mineralogies do |t|
  		t.change :quartz, :int
			t.change :calcite, :int
			t.change :pyrite, :int
  		t.change :pyrrhotite, :int
  		t.change :axinite, :int
  		t.change :actinolite, :int
  		t.change :tourmaline, :int
		end
  end
end
