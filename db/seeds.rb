user = User.first
user.posts.create(:title => "Welcome to Blorgh!", :text => "Blorgh is a new blogging application written in Rails.")