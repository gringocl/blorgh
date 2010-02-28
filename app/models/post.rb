class Post < ActiveRecord::Base
  default_scope :order => "created_at desc"
  named_scope :by_permalink, lambda { |permalink| { :conditions => { :permalink => permalink }, :include => { :comments => :user } } }
  
  belongs_to :user
  has_many :comments

  before_validation_on_create :set_permalink_and_published_at
  
  validates_presence_of :title, :text, :permalink
  validates_uniqueness_of :title, :scope => :published_at, :message => "has already been used today. Please use another one."
  
  def to_param
    permalink
  end
  
  private
  
  def set_permalink_and_published_at
    self.permalink = title.parameterize
    self.published_at = Date.today
  end
end
