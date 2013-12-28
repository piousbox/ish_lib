require 'sitemaps_tasks'

namespace :sitemaps do
  
  desc 'generate'
  task :generate => :environment do
    s = SitemapsTasks.new
    s.generate
  end

end

