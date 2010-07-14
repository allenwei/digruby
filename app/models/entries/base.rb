module Entries
  class Base < ActiveRecord::Base
    set_table_name :entries

    validates_uniqueness_of :url

    belongs_to :source,:class_name => "Sources::Base"
    has_many :tags, :through => :entries_tags
    has_many :entries_tags,:class_name => "::EntriesTags",:foreign_key => :entry_id




    def abstract_class?
      true
    end

    def self.create_by(source,entry)
      rss_entry = source.entries.create new_entry_attrs(entry)
      rss_entry.short_url = Base52.encode(rss_entry.id,SHORT_URL_OFFSET)
      tags(entry).each do |t|
        tag = Tag.find_or_create_by_name(t.downcase)
        rss_entry.tags << tag 
      end
      rss_entry.save
      rss_entry
    end

    def self.new_entry_attrs(entry)
      raise "Not Implement" 
    end

    def self.tags(entry)
      []
    end


  end
end

