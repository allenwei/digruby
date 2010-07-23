class SessionRank < ActiveRecord::Base
  after_create :update_rank

  def update_rank
    rank_obj = Rank.find_or_create_by(:record_id => self.record_id)
    rank_obj.rank ||= 0
    rank_obj.rank = rank_obj.rank + 1
    rank_obj.save!
  end 

  def self.voted?(record_id,session)
    SessionRank.exists?(['record_id = ? and session_id =?',record_id,session[:session_id]]) 
  end
end
