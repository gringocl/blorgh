require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  subject { Post.make }
  
  it "sets the permalink" do
    subject.permalink.should_not be_blank
  end
  
  it "is not able to use the same title twice" do
    Post.make(:title => "Something")
    lambda { Post.make(:title => "Something") }.should raise_error(ActiveRecord::RecordInvalid)
    post = Post.make_unsaved(:title => "Something")
    post.save
    post.should have(1).errors_on(:title)
    post.errors_on(:title).should eql(["has already been used today. Please use another one."])
  end
  
end