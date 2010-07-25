class Rank 
  include MongoMapper::Document

  key :record_id, :type => Integer
  key :rank, :type => Integer
  key :comment, :type => Integer
  key :date, :type => Date

end
