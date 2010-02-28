module PostsHelper
  def archive?
    params[:action] == "archive"
  end
  
  def archive_header 
    if params[:month]
      "01-#{params[:month]}-#{params[:year]}".to_time.strftime("%B %Y") + " Archives"
    else
      "01-01-#{params[:year]}".to_time.strftime("%Y") + " Archives"
    end
  end
end