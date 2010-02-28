class Post < ActiveRecord::Base
  default_scope :order => "created_at desc"
  
  belongs_to :user
  has_many :comments

  before_save :set_permalink
  
  validates_presence_of :title
  validates_presence_of :text
  
  def to_param
    title.parameterize
  end
  
  private
  
  def set_permalink
    self.permalink = title.parameterize
  end
end
