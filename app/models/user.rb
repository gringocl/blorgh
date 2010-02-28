class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_email_field = false
  end
  
  attr_protected :admin
  
  has_many :posts
end
