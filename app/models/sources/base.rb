module Sources
  class Base < ActiveRecord::Base
    set_table_name :sources

    def abstract_class?
      true
    end
    validates_presence_of :url,:name

    def update(time)

    end
  end
end
