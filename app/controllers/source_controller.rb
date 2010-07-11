class SourceController < ApplicationController
  def index
    @entries = Entries::Base.all(:order => ['date_published desc'])
  end

  def submit
    if source = Sources::Rss.create(:feed_url => params[:source])
      source.update
    end
    redirect_to :action => :index
  end
end
