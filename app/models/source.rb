class Source < ActiveRecord::Base
  validates_presence_of :url,:name
end
