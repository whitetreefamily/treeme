class Admin < ActiveRecord::Base
  attr_accessor :old_password
  attr_accessor :password, :password_confirmation
  before_save :encrypt_password
  before_update :encrypt_password
  belongs_to :user

  extend FriendlyId
  friendly_id :username, :use => [:finders]
  def self.authenticate(username,  password)
    admin = find_by_username(username)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
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
