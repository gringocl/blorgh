require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostsController do
  it "should not be able to find a post based on a permalink that doesn't exist" do
    Post.make
    get :show, :id => "totally-non-existant"
    flash[:error].should eql("The post you were looking for could not be found.")
    response.should redirect_to(root_path)
  end
end