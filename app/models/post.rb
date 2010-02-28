class Post < ActiveRecord::Base
  default_scope :order => "created_at desc"
  
  belongs_to :user
  has_many :comments

  before_validation_on_create :set_permalink
  
  validates_presence_of :title, :text, :permalink
  
  def to_param
    permalink
  end
  
  private
  
  def set_permalink
    self.permalink = title.parameterize
  end
end
