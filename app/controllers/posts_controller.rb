class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    # All of this for "pretty" URLs
    day = "#{params[:year]}/#{params[:month]}/#{params[:day]}".to_date rescue nil
    if !(@post = Post.by_permalink(params[:id]).by_day(day).first)
      flash[:error] = "The post you were looking for could not be found."
      redirect_to root_path
    end
    
    @comment = Comment.new
  end
  
  def archive
    @posts = Post.by_month(params[:month].to_i, :year => params[:year])
    render :action => "index"
  end
  
  def feed
    @posts = Post.all
    respond_to do |format|
      format.atom
    end
  end
end