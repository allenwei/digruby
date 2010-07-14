class EntriesTags < ActiveRecord::Base
  set_table_name :entries_tags
  belongs_to :entry 
  belongs_to :tag
end
