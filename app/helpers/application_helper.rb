# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def dotiw(time)
    distance_of_time_in_words(Time.now, time, true, { :except => ["minutes", "seconds"] } ) + " ago"
  end
  
  def post_path(post)
    time = post.created_at
    dated_post_path(:year => time.year, :month => time.month, :day => time.day, :id => post.permalink)
  end
end
