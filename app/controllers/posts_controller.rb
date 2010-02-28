class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by_permalink(params[:id], :include => { :comments => :user })
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