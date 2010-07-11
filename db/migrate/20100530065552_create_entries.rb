class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :title
      t.integer :source_id
      t.string :content,:limit => 20000
      t.datetime :date_published
      t.string :url
      t.string :author
      t.string :categories
      t.string :description, :limit => 10000
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
