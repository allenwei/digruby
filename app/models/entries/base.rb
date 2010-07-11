module Entries
  class Base < ActiveRecord::Base

    set_table_name :entries

    def abstract_class?
      true
    end

    belongs_to :source
  end
end

