require 'open-uri'

module Sources
  class Rss < ::Source 

    def update(time = nil)
      updated_time = self.last_updated || Time.new 

      feed = FeedNormalizer::FeedNormalizer.parse open(self.url) 
      return [] if self.last_updated && feed.last_updated < updated_time
      feed.entries.each do |entry|
        Entries::Rss.create_by(entry,self)
      end 

      self.update_attributes(:last_updated => Time.now)
    end
  end
end
