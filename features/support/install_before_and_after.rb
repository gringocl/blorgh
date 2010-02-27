Before do |scenario| 
  if scenario.feature.name.split("\n").first == "Feature: Installing Blorgh"
    `cp config/database.yml config/database.yml.bak`
  end
end

After do |scenario|
  if scenario.feature.name.split("\n").first == "Feature: Installing Blorgh"
    `cp config/database.yml.bak config/database.yml`
  end
end
