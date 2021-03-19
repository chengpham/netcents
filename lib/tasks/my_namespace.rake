namespace :bitcoin do
  desc "Rake task to get latest bitcoin with highest value every 5 minutes"
  task :fetch => :environment do
    # puts "Updating news Articles…"
    # Bitcoin.create(_hash: Time.now)
    # Article.getArticles()
    puts "#{Time.now} — Success!"
  end
end