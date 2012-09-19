class CreateKeywords < ActiveRecord::Migration
  def up
  	create_table :keywords do |t|
  	  t.string :name
  	  t.integer :project_id
  	  t.timestamps
  	end
  end

  def down
  	drop_table :keywords
  end
end
