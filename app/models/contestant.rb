class Contestant < ActiveRecord::Base
  has_many :contestant_votes
  belongs_to :user
  belongs_to :vote_page


  mount_uploader :image,  ImageUploader

  def self.by_votes
    select('contestants.*, coalesce(value, 0) as votes').
        joins('left join contestant_votes on contestant_id=contestants.id').
        order('votes desc')
  end

  def votes
    read_attribute(:votes) || contestant_votes.sum(:value)
  end
end
