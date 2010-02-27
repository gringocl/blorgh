require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::IndexController do
  describe "Users" do
    before do
      controller.stub(:current_user).and_return(User.create(:login => "user", :password => "password", :password_confirmation => "password"))
    end
  
    it "are not able to access the admin section" do
      get :index
      response.should redirect_to(root_path)
      flash[:error].should eql("You are not allowed in there! You are not an admin.")
    end
    
  end
  
  describe "Admins" do
    before do
      user = User.create(:login => "admin", :password => "password", :password_confirmation => "password")
      controller.stub(:current_user).and_return(user)
      user.admin = true
      user.save
    end
  
    it "are able to access the admin section" do
      get :index
      response.should_not redirect_to(root_path)
      flash[:error].should be_blank
    end
  end
    
  
end