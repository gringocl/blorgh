namespace :install do
  desc "Cleans up all the installation-related files"
  task :clean do
    `touch #{Rails.root + 'tmp/restart.txt'}`
    for file in install_files
      `rm -rf #{Rails.root + file}`
    end
  end
  
  task :move do 
    for file in install_files
      backup_name = "#{file}.bak"
      `mv #{Rails.root + file} #{Rails.root + backup_name}`
    end
  end
  
  def install_files
    [
     "public/index.html",
     "app/metal/install.rb",
     "app/views/install"
    ]
  end
end