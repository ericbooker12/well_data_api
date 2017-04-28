class CreateWells < ActiveRecord::Migration[5.0]
  def change
    create_table :wells do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.decimal :total_depth

      t.timestamps
    end
  end
end
