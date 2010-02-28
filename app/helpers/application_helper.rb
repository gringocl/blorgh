# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def dotiw(time)
    distance_of_time_in_words(Time.now, time, true, { :except => ["minutes", "seconds"] } ) + " ago"
  end
end
