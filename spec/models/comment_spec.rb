require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  subject { Comment.make(:user => User.find_by_login("user") || User.make(:user)) }
  
  it "sets the email and name during creation" do
    subject.email.should_not be_blank
    subject.name.should_not be_blank
  end
  
  it "files a comment as spam" do
    comment = Comment.make(:user => User.find_by_login("user") || User.make(:user), :text => "-online 4u 4-u acne")
    comment.spam_status.should eql("spam")
  end
end