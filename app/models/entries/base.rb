module Entries
  class Base < ActiveRecord::Base
    set_table_name :entries

    cattr_reader :per_page
    @@per_page = 10

    validates_uniqueness_of :url

    belongs_to :source,:class_name => "Sources::Base"
    has_many :tags, :through => :entries_tags
    has_many :entries_tags,:class_name => "::EntriesTags",:foreign_key => :entry_id

    after_create :set_short_url

    def abstract_class?
      true
    end

    def self.new_entry_attrs(entry)
      raise "Not Implement" 
    end

    def self.tags(entry)
      []
    end

    def set_short_url
      self.update_attributes(:short_url => Base52.encode(self.id,SHORT_URL_OFFSET))
    end

  end
end

