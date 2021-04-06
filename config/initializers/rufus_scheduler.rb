require 'rufus/scheduler'
require 'rubygems' 
require 'rake' 

scheduler = Rufus::Scheduler.new 
scheduler.every "5m" do  
   system "rake batch:retrieve_bitcoins RAILS_ENV=development"  
end

