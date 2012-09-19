class CreateAudits < ActiveRecord::Migration
  def up
  	create_table :audits do |t|
  		t.integer :project_idç
  		t.timestamps
  	end
  end

  def down
    drop_table :audits
  end
end
