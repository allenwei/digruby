class Rank 
  include Mongoid::Document
  field :record_id, :type => Integer
  field :rank, :type => Integer
  field :comment, :type => Integer
  field :date, :type => Date
end
