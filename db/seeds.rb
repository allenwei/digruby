# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
  rss = Sources::Rss.create(:feed_url => "http://feeds2.feedburner.com/digruby",:name => "DigRuby",:url => "http://allenwei.cn")
  rss.update
  rss = Sources::Rss.create(:feed_url => "http://feeds2.feedburner.com/Rubyflow",:name => "Rubyflow",:url => "http://www.rubyflow.com")
  rss.update
