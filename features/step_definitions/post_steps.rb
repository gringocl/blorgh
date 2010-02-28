Given /^there is a post called "([^\"]*)"$/ do |title|
  # Uses the blueprint if there is one, if not uses the sample blueprint and just sets the title.
  p = Post.make(title.downcase.gsub(" ","_").to_sym)
  p.title = title
  p.save!
end