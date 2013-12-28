require 'sitemaps_tasks'

namespace :sitemaps do
  
  desc 'generate'
  task :generate => :environment do
    SitemapsTasks.generate
  end

end

