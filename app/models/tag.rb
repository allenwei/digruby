class Tag < ActiveRecord::Base
  has_many :entries, :through => :entries_tags,:class_name => "Entries::Base"
  has_many :entries_tags,:class_name => "::EntriesTags"
end
