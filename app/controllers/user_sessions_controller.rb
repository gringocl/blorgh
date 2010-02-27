class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = "You have been logged in."
      if @user_session.user.admin?
        redirect_to admin_root_path
      else
        redirect_to root_path
      end
    else
      flash[:failure] = "You could not be logged in."
      render :action => "new"
    end
  end
  
end
