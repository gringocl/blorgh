Then /^I should see the post has (\d+) comments?$/ do |number|
  Nokogiri::HTML(response.body).css(".comments_count").text.should include("#{number} comment")
end
