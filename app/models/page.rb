class Page < ActiveRecord::Base
  has_one :info, :dependent => :destroy
  has_one :vote_page
  mount_uploader :image, ImageUploader
  has_many :articles,  :dependent => :destroy
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :branches, :dependent => :destroy
  has_many :users, :through => :branches ,:dependent => :destroy
  belongs_to :user

  def increment(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end


  def toter_page
    Page.select('pages.*, max(branches.id) as last_commented_at').
        joins(:branches).
        group('pages.id').
        order('last_commented_at DESC').
        limit(5)
  end

  def self.search(search)
    if  search
       where("name like ?", "%#{search}%")
    else
      scoped
      end
  end
end
