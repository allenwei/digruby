module Sources
  class Rss < Base

    validates_uniqueness_of :feed_url

    has_many :entries, :class_name => "::Entries::Rss", :foreign_key => :source_id

    attr_reader :feed

    before_create :set_feed_info
    after_create :save_entries


    def update(time = nil)
      feed = Feedzirra::Feed.fetch_and_parse(self.feed_url)
      return false if feed.last_modified <= self.last_modified
      feed.entries.each do |entry|
        create_entry(entry) if entry.last_modified > self.last_modified
      end
      self.update_attributes(:last_modified => feed.last_modified)
      return true
    end

    def create_entry(entry)
      new_entry = self.entries.create(Entries::Rss.new_entry_attrs(entry))
      Entries::Rss.tags(entry).each do |tag|
        tag = Tag.find_or_create_by_name(tag.downcase)
        new_entry.tags << tag 
      end
      new_entry.save
    end

    def feed_url_valid?
      return false if self.feed_url.blank?
      return false if URI.parse(self.feed_url).host.nil?
      return false  unless @feed = Feedzirra::Feed.fetch_and_parse(self.feed_url)
      return true
    end

    def set_feed_info
      self.name ||= @feed.title
      self.url ||= @feed.url
      self.last_modified = @feed.last_modified
    end

    def save_entries
      return unless @feed
      @feed.entries.each do |entry| 
        create_entry(entry)
      end
      return true
    end


  end
end
