class SourceController < ApplicationController
  def index
    @entries = Entries::Base.paginate(:page => params[:page],:order => 'date_published DESC',:include => [:tags,:entries_tags])
  end

  def new 
    @source = Sources::Base.new(:feed_url => params[:source])
    render :action => :new ,:layout => false
  end

  def create
    status = {}
    source = Sources::Rss.new(params[:sources_base])
    if source.save
      status[:status] = true
    else 
      status[:status] = false 
      status[:errors] = source.errors.map {|error| error.join(" ")}.join(";")
    end
    render :json => status
  end

  def next_page
    @entries = Entries::Base.paginate(:page => params[:page],:order => 'date_published DESC',:include => [:tags,:entries_tags])
  end
end
