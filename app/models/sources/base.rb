module Sources
  class Base < ActiveRecord::Base
    set_table_name :sources

    validates_uniqueness_of :feed_url
    validates_uniqueness_of :name
    def abstract_class?
      true
    end

    def update(time=nil)
      raise "Not Implement"
    end

  end
end
