class SourceController < ApplicationController
  def index
    @entries = Entries::Base.all(:order => ['date_published desc'],:include => [:tags,:entries_tags])
  end

  def new 
    @source = Sources::Base.new(:feed_url => params[:source])
    render :action => :new ,:layout => false
  end

  def create
    status = {}
    source = Sources::Rss.new(params[:sources_base])
    if source.save
      begin
        if source.update
          status[:status] = true
        else 
          status[:status] = false 
          status[:errors] = "Url is not correct!"
        end
      rescue Exception
        status[:status] = false 
        status[:errors] = "Url is not correct!"
      end
    else 
      status[:status] = false 
      status[:errors] = source.errors.map {|error| error.join(" ")}.join(";")
    end
    render :json => status
  end
end
