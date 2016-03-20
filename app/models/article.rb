class Article < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category
  belongs_to :page
  has_many :comments, :dependent => :destroy

  validates_length_of :body, :minimum => 30, :message => "Post must be 25 up word"
  def increment(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end

  extend FriendlyId
  friendly_id :body, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
  #def to_param
   # "#{id} #{body}".parameterize
  #end


end
