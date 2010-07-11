module Entries 
  class Rss < Base

    def self.new_entry_attrs(entry)
      mappings = {
        :title => :title ,
        :content => :content ,
        :date_published => :published,
        :url => :url,
        :author => :author,
        :categories => :categories,
        :description => :summary
      }

      attrs = {}

      mappings.each_pair do |k,v| 
        value = entry.send(v)
        new_value = case value
                    when String 
                      value.sanitize
                    when Array
                      value.join(",")
                    else
                      value
                    end
        attrs[k] = new_value
      end
      attrs
    end
  end
end
