require 'sinatra'
require 'install_view_helpers'
load Rails.root + "Rakefile"
# Dir[Rails.root + 'lib/tasks/**/*.rake'].each { |file| load file }

class Install < Sinatra::Base
  include InstallViewHelpers
  get '/install' do
    render :install
  end
  
  post '/install/go' do
    File.open(database_yml, "w+") do |f|
      f.write database_config
    end
    complete
  end
  
  get '/install/done' do
    complete
  end
  
  private
  
    def complete
      begin
        Rake::Task['db:create:all'].invoke
        Rake::Task['db:schema:load'].invoke
        ActiveRecord::Base.establish_connection(YAML.load_file(database_yml)["production"])
        render :complete
        Post.first
        `touch #{Rails.root + 'tmp/restart.txt'}`
        `rm -rf #{Rails.root + 'public/index.html'}`
        `rm -rf #{Rails.root + 'app/metal/install.rb'}`
        `rm -rf #{Rails.root + 'app/views/install'}`
      rescue Exception => @e
        error(@e.message)
        render :error
      end
    end
    
    def database_yml
      Rails.root + "config/database.yml"
    end
  
    def database_config
      params[:database].delete("socket") if params[:database][:socket].blank?
      p params[:database]
      test = params[:database].merge(:database => params[:database][:database] + '_test')
      production = params[:database]
      { 'standard' => production, 
        'production' => production,
        'development' => production,
        'cucumber' => test,
        'test' => test 
      }.to_yaml
    end
    
    alias_method :old_render, :render
    
    def render(view)
      old_render :erb, view, :views => Rails.root + "app/views/install"
    end
    
    def error(message)
      @error = if /Can't connect to local MySQL server through socket/.match(message)
        "<p>The socket you have specified for your database is incorrect. On Ubuntu this is usually /var/run/mysqld/mysqld.sock. On other operating systems this can be left blank.</p>
         
         <p>This error can also occur if you started up your server in Webrick with a faulty config/database.yml. Try restarting your server and see if that fixes it.</p>"
      # I give up trying to diagnose your problem!
      elsif /Access denied for user/.match(message)
        if caller.last.split(":").first == "script/server"
          "<p>Blorgh has detected it is being run through script/server. Through script/server Blorgh is unable to reload itself, which means no reloading of the database configuration.</p>
           <p>In order for the install procedure to complete, please restart your server (causing the database configuration to be re-read) and press the 'Already done!' link.</p>"
        else
          "<p>The user you are attempting to access the database server with has invalid credentials. Please go back and try again.</p>
        
          <p>You can look in the config/database.yml file to check if they are correct.</p>
        
          <p>If they still do not work consult your database administrator.</p>"
        end
      else
        message
      end
    end
      
end