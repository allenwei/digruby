class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :title
      t.integer :source_id
      t.text :content
      t.time :date_published
      t.string :url
      t.string :author
      t.string :categories
      t.text :description
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
