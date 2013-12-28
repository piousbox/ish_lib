
require 'rubygems'
require 'builder'

class SitemapsTasks

  def self.generate_sitemap
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
    @host = request.host

    builder = Builder::XmlMarkup.new(:indent=>2)
    builder.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
    builder.my_elements do |e|
      builder.myitem {|element| element.my_element_name('element_value')}
    end
    
  end

end

