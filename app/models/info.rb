class Info < ActiveRecord::Base
  belongs_to :page
     delegate :name, to: :page, prefix: true
  before_save :set_username

  def set_username
    self.name = page_name
  end



  extend FriendlyId
  friendly_id :name, :use => [:finders]

end
