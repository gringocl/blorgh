require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  subject { Post.make }
  
  it "sets the permalink" do
    subject.permalink.should_not be_blank
  end
  
end