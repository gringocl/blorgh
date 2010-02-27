namespace :install do
  desc "Cleans up all the installation-related files"
  task :clean do
    `touch #{Rails.root + 'tmp/restart.txt'}`
    `rm -rf #{Rails.root + 'public/index.html'}`
    `rm -rf #{Rails.root + 'app/metal/install.rb'}`
    `rm -rf #{Rails.root + 'app/views/install'}`
  end
end