class Rank 
#  include Mongoid::Document
  #field :record_id, :type => Integer
  #field :rank, :type => Integer
  #field :comment, :type => Integer
  #field :date, :type => Date
  include MongoMapper::Document

  key :record_id, :type => Integer
  key :rank, :type => Integer
  key :comment, :type => Integer
  key :date, :type => Date

end
