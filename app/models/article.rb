class Article < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category
  belongs_to :page
  has_many :comments, :dependent => :destroy
  before_save :set_username, :truncate_values

  validates_length_of :body, :minimum => 10, :message => "Post must not be empty"
  def increment(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end

  def  truncate_values
    self.title = self.title[0..9] if self.title.length > 10
  end

  def set_username
    self.title = self.body
  end


  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
  #def to_param
   # "#{id} #{body}".parameterize
  #end


end
