class CreateSessionRanks < ActiveRecord::Migration
  def self.up
    create_table :session_ranks do |t|
      t.string :session_id
      t.integer :record_id 
    end
    add_index(:session_ranks, [:session_id, :record_id], :unique => true)
    add_index(:session_ranks,:session_id) 
  end

  def self.down
    drop_table :session_ranks
  end
end
