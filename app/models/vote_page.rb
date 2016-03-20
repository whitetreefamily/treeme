class VotePage < ActiveRecord::Base
  has_many :contestants
  belongs_to :user
  belongs_to :page

  def total_vote_page
    ContestantVote.joins(:contestant).where(contestants: {vote_page_id: self.id}).sum('value')
  end



  def ensure_not_author
    errors.add :user_id, "is the creator of the contestant" if contestant.user_id == user_id
  end

  extend FriendlyId
  friendly_id :name, :use => [:finders]

end
