class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_email_field = false
  end
  
  before_save :set_admin
  
  attr_protected :admin
  
  has_many :posts
  
  def to_s
    name || login
  end
  
  private
  
  def set_admin
    self.admin = true if User.count == 0
  end
  
end
