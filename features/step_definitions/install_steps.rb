Given /^the following installs:$/ do |installs|
  Install.create!(installs.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) install$/ do |pos|
  visit installs_url
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following installs:$/ do |expected_installs_table|
  expected_installs_table.diff!(tableish('table tr', 'td,th'))
end
