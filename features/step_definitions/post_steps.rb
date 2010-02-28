Given /^there is a post called "([^\"]*)"$/ do |title|
  # Uses the blueprint if there is one, if not uses the sample blueprint and just sets the title.
  @post = Post.make(title.downcase.gsub(" ","_").to_sym)
  @post.title = title
  @post.save!
end


Given /^there is a post called "([^\"]*)" created on "([^\"]*)"$/ do |title, time|
  steps("Given there is a post called \"#{title}\"")
  @post.created_at = time.to_time
  @post.save!
end
