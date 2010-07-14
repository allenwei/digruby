class RemoveContentAndCategoriesColumnInEntriesTable < ActiveRecord::Migration
  def self.up
    remove_column :entries, :content
    remove_column :entries, :categories
  end

  def self.down
    add_column :content, :string ,:limit => 20000
    add_column :categories, :string 
  end
end
