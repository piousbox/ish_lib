require 'rubygems'
require 'builder'

class SitesTasks < ActionController::Base
  
  def pretty_date args
    args.strftime('%Y-%m-%d')
  end

  def self.n_reports_galleries
    Site.each do |site|
      save = false
      if site.n_galleries.blank?
        site.n_galleries = site.galleries.length
        save = true
      end
      if site.n_reports.blank?
        site.n_reports = site.reports.length
        save = true
      end
      site.save && puts( "+++ +++ Site #{site.domain}/#{site.lang}" )
    end
  end
  
end

