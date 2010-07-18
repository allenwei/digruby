module Sources
  class Base < ActiveRecord::Base
    set_table_name :sources

    def abstract_class?
      true
    end

    def self.create_by(url,name=nil)
      raise "Not Implement"
    end


    def update(time=nil)
      raise "Not Implement"
    end


    def feed_url_valid?
      raise "Not Implement"
    end

    protected
    def validate
      errors.add("feed_url", "has invalid format") unless feed_url_valid?
    end

  end
end
