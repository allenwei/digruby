class SController < ApplicationController
  def index 
    id = params[:id]
    entry_id = Base52.decode(id,SHORT_URL_OFFSET)
    @entry = Entries::Base.find_by_id(entry_id)
    unless @entry
      render :status => 404 
    else 
      @entry
    end
  end
end
