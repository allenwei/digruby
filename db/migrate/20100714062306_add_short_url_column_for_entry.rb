class AddShortUrlColumnForEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :short_url,:string 
  end

  def self.down
    remove_column :entries, :short_url
  end
end
