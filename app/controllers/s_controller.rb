class SController < ApplicationController
  def index 
    id = params[:id]
    entry_id = Base52.decode(id,SHORT_URL_OFFSET)
    @entry = Entries::Base.find_by_id(entry_id)
  end
end
