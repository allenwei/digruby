module Sources
  class Base < ActiveRecord::Base
    set_table_name :sources

    def abstract_class?
      true
    end

    def update(time)

    end
  end
end