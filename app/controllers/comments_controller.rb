class CommentsController < ApplicationController
  before_filter :find_post
  
  def create
    @comment = @post.comments.build(params[:comment].merge(:user => current_user))
    if @comment.save
      flash[:success] = "Thanks for your comment!"
      redirect_to @post
    else
      # Remove it otherwise it tries to render it.
      @post.comments -= [@comment]
      flash[:error] = "Could not post your comment."
      render :template => "posts/show"
    end
  end
  
  private
  
    def find_post
      @post = Post.find_by_permalink!(params[:post_id])
      rescue ActiveRecord::RecordNotFound
        flash[:error] = "The post you were looking for could not be found."
        redirect_to root_path
    end
    
end
