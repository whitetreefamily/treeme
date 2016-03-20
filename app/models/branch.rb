class Branch < ActiveRecord::Base
  belongs_to :user
  belongs_to :page

  validate :friendship_validation

  private

  def friendship_validation
    if Branch.where("(user_id=? AND page_id=?) OR (user_id=? AND page_id=?)", self.user_id, self.page_id, self.page_id, self.user_id).any?
      errors.add(:branch, "friendship exists")
    end
  end


  def validation?
     Branch.where("(user_id=? AND page_id=?) OR (user_id=? AND page_id=?)", self.user_id, self.page_id, self.page_id, self.user_id).any?
      errors.add(:branch, "friendship exists")
  end

  def self.friendship_exists?(user1, user2)
    Branch.where("(user_id = ? AND page_id = ?) OR (user_id = ? AND page_id = ?)", user1.id, user2.id, user2.id, user1.id).size > 0
  end

  scope :complete, ->  {where("comleted_at is not nill")}
  scope :incomplete, ->  {where(comleted_at:  nill )}

end
