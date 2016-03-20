class Category < ActiveRecord::Base
   has_many :articles
  extend FriendlyId
  friendly_id :name, :use => [:finders]
  has_and_belongs_to_many :users


end
