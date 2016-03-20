class ContestantVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :contestant

  #validation
  validates_uniqueness_of :contestant_id, scope: :user_id
  validates_presence_of :user_id, :contestant_id, :value
  validates_inclusion_of :value, in: [1]

  def ensure_not_author
    errors.add :user_id, "is the creator of the contestant"  if contestant.user_id == user_id
  end

end
