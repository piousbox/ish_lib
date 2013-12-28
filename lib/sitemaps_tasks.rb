require 'rubygems'
require 'builder'

class SitemapsTasks
  
  include Rails.application.routes.url_helpers
  
  def self.generate
    travel_site = Site.mobi
    travel_tag = Tag.mobi

    @reports = Report.any_of( :site => travel_site, :tag => travel_tag )

    # @galleries = Gallery.any_of( :site => travel_site, :tag => travel_tag )
    @galleries = []

    # @videos = Video.any_of( :site => travel_site, :tag => travel_tag )
    @videos = []

    # @tags = Tag.where( :site => travel_site )
    @tags = []

    @cities = City.all

    @venues = Venue.all

    # @users = User.all
    @users = []

    # @meta = [ { :url => cities_path } ]
    @meta = []
    @host = 'travel-guide.mobi'

    #
    # the (builder) view
    #
    xml = Builder::XmlMarkup.new(:indent=>2)
    xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
    xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

      @reports.each do |report|
        xml.url do
          xml.loc "http://#{@host}/en#{report_path(report.name_seo)}"
          xml.lastmod pretty_date report.created_at
        end
      end
      
      @galleries.each do |g|
        xml.url do
          xml.loc "http://#{@host + gallery_path(g.galleryname, 0)}"
          xml.lastmod pretty_date g.created_at
        end
      end
      
      @cities.each do |c|
        xml.url do
          xml.loc "http://#{@host + city_path(c.cityname)}"
          xml.lastmod pretty_date c.created_at
        end
      end
      
      @tags.each do |c|
        xml.url do
          xml.loc "http://#{@host + tag_path(c.name_seo)}"
          xml.lastmod pretty_date c.created_at
        end
      end
      
      @users.each do |user|
        xml.url do
          xml.loc "http://#{@host + user_path(user.username)}"
          xml.lastmod pretty_date user.created_at
        end
      end
      
      @venues.each do |c|
        xml.url do
          xml.loc "http://#{@host}/en#{venue_path(c.name_seo)}"
          xml.lastmod pretty_date c.created_at
        end
      end

      # @meta.each do |m|
      #   xml.url do
      #     xml.loc "http://#{request.host_with_port}#{m[:url]}"
      #     xml.lastmod pretty_date Time.now
      #   end
      # end
      
    end

    File.open( 'sitemap.xml', 'w' ) do |f|
      f.write builder
    end
    
  end
end

