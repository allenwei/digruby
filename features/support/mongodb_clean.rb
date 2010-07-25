After do |scenario|
  puts "cleaning mongodb...."
  MongoMapper.database.collections.each do |collection|
    unless collection.name =~ /^system\./
      collection.remove
    end
  end
  puts "finished cleaning mongodb."
end

