# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "application"
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  helper_method :current_user, :logged_in?
  
  before_filter :load_archive_dates
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def logged_in?
    !!current_user
  end

  def load_archive_dates
    @months = []
    Post.all.group_by { |p| p.created_at.strftime("%B %Y")}.each do |month, posts|
      post = posts.first
      @months << [post.created_at.strftime("%B"), post.created_at.strftime("%m"), post.created_at.strftime("%Y")]
    end
  end
  
end
