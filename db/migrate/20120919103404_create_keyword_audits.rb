class CreateKeywordAudits < ActiveRecord::Migration
  def up
    create_table :keyword_audits do |t|
      t.integer :audit_id
      t.integer :keyword_id
      t.integer :occurences
      t.timestamps
    end
  end

  def down
    drop_table :keyword_audits
  end
end
