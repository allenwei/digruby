module Sources
  class Rss < Base
    has_many :entries, :class_name => "::Entries::Rss", :foreign_key => :source_id

    def update(time = nil)
      feed = Feedzirra::Feed.fetch_and_parse(self.feed_url)
      feed.entries.each do |entry|
        self.entries.create Entries::Rss.new_entry_attrs(entry)
      end
    end
  end
end
