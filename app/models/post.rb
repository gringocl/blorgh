class Post < ActiveRecord::Base
  belongs_to :user
  
  default_scope :order => "created_at desc"
  
  validates_presence_of :title
  validates_presence_of :text
end
