class CreateSummaryDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :summary_descriptions do |t|
    	t.float :depth
    	t.text :content
      t.references :well, foreign_key: true
      t.timestamps
    end
  end
end
