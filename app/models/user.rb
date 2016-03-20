class User < ActiveRecord::Base
  attr_accessor :old_password

  before_save :encrypt_password
  before_update :encrypt_password
  attr_accessor :password, :password_confirmation
  validates :email, presence: true,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates_length_of :name, :minimum => 4
  validates :name, :email, :presence => true
  validates_length_of :password, :minimum => 7, :allow_blank => true,:on => :create
  validates :password, :presence => true,:on => :create
  validates_confirmation_of :password, :presence => true,:message => "Please let your password be the same confirmation"
  has_many :branches
  has_many :pages, :through => :branches,:dependent => :destroy
  mount_uploader :image, ImageUploader
  has_one :vote_page
  has_many :contestants
  has_many :contestant_votes
  has_many :articles, -> { order('updated_at DESC, title ASC')},
           :dependent => :destroy
  has_many :comments ,  :dependent => :destroy
  has_and_belongs_to_many :categories
  has_many :blog, :class_name => "Page" ,:dependent => :destroy

  before_create { generate_token(:auth_token) }
  def can_branch_for?(page)
    branches.build(page: 1, page: page).valid?
  end
  validates_length_of :email, :maximum => 100, :message => "your comment must not be more than 140 characters"
  def can_vote_for?(contestant)
    contestant_votes.build(value: 1,  contestant: contestant ).valid?
  end
  def self.search(search)
    if  search
      where("name like ?", "%#{search}%")
    else
      scoped
    end
  end
  def total_votes
    ContestantVote.joins(:contestant).where(contestants: {user_id: self.id}).sum('value')
  end
  extend FriendlyId
  friendly_id :name, :use => [:finders]

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end


  def self.authenticate(email,  password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end


  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
