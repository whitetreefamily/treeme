class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates_presence_of   :body, :user_id
  validates_length_of :body, :minimum => 2, :message => "Post must be 25 up word"
  def timestamp
    created_at.strftime('%d %B %Y')
  end
end
