task :cron => :environment do
  if Time.now.hour == 0 # run at midnight
    puts "Updating feed ..."
    Sources::Rss.all.each do |rss|
      puts "Updating feed #{rss.feed_url} ..."
      rss.update
      puts "Finish update feed #{rss.feed_url} ..."
    end
    puts "done."
  end
end

