class CreateEntriesTags < ActiveRecord::Migration
  def self.up
    create_table :entries_tags do |t|
      t.integer :entry_id
      t.integer :tag_id
      t.timestamps
    end
  end

  def self.down
    drop_table :entries_tags
  end
end
