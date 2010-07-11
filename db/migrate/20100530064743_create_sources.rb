class CreateSources < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :feed_url
      t.string :type
      t.datetime :last_updated
      t.datetime :last_modified
      t.string :author
      t.string :image
      t.string :etag
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sources
  end
end
