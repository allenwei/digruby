module Sources
  class Rss < Base
    validates_uniqueness_of :feed_url
    validates_uniqueness_of :name

    has_many :entries, :class_name => "::Entries::Rss", :foreign_key => :source_id

    def update(time = nil)
      feed = Feedzirra::Feed.fetch_and_parse(self.feed_url)
      return false if feed.nil?
      feed.entries.each do |entry|
        Entries::Rss.create_by(self,entry)
      end
      feed
    end
  end
end
