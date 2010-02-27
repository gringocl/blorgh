class Admin::ApplicationController < ApplicationController
  before_filter :admin_required
  
  private
  
  def admin_required
    if !current_user.admin?
      flash[:error] = "You are not allowed in there! You are not an admin."
      redirect_to root_path
    end
  end
end