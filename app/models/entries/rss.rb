module Entries 
  class Rss < ::Entry
    def self.create_by(entry,source)
      unless self.exists?(:url => entry.url)
       self.create(new_entry_attrs(entry).merge(:source => source))
      end
    end

    private 
    def self.new_entry_attrs(entry)
      mappings = {
        :title => :title ,
        :content => :content ,
        :date_published => :date_published,
        :url => :url,
        :author => :author,
        :categories => :categories,
        :description => :description
      }

      attrs = {}
      
      mappings.each_pair do |k,v| 
        attrs[k] = entry.send(v)
      end
    end


  end
end
