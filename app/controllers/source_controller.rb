class SourceController < ApplicationController
  def index
    @entries = Entries::Base.all
  end
end
