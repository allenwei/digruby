class SourceController < ApplicationController
  def index
    @entries = Entries::Base.all(:order => ['date_published desc'])
  end

  def submit
    source = Sources::Rss.create(:feed_url => params[:source])
    source.update
    render :action => :index
  end
end
