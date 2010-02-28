class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Thanks for registering!"
      redirect_to root_path
    else
      flash[:failure] = "Oops, something went wrong. Please try again."
      render :action => "new"
    end
  end
end
