module Sources
  class Base < ActiveRecord::Base
    set_table_name :sources

    validates_uniqueness_of :feed_url
    def abstract_class?
      true
    end

    def update(time)

    end
  end
end
