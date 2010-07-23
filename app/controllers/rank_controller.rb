class RankController < ApplicationController

  def like
    unless Entries::Base.exists?(params[:id]) 
      render :json => {:success => false, :msg => "Can't find this Entry."}
      return 
    end

    if SessionRank.exists?(['record_id = ? and session_id =?',params[:id],session[:session_id]])
      render :json => {:success => false, :msg => "You already vote this entry."}
    else
      SessionRank.create!(:record_id => params[:id],:session_id => session[:session_id])
      render :json => {:success => true,:msg => "Your vote successful, thanks!"}
    end

  end
end
