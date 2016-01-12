
require 'spec_helper'

describe Video do

  before :each do
    setup_sites
    
    User.all.each { |u| u.remove }
    @user = FactoryGirl.create :user

    Video.all.each { |u| u.remove }   
  end

  describe 'videos' do
    it 'should be ok' do
      v = Video.new :site => @site
      v.youtube_id = '1'
      v.user = @user
      v.save.should eql true
      v.class.name.should eql 'Video'
    end
  end

  describe '#add_newsitem' do
    before :each do
      City.all.each { |c| c.remove }
      @city = FactoryGirl.create :city
      @request = FakeRequest.new
      setup_sites
      Video.all.each { |v| v.remove }
      video = Video.create :user_id => @user.id, :youtube_id => '555', :city_id => @city.id, :site_id => @site.id, :is_public => true, :descr => 'checking add_newsitem'
    end
    it 'for city' do
      City.find( @city.id ).newsitems.length.should eql 1
    end
    it 'for site' do
      Site.find( @site.id ).newsitems.length.should eql 1
    end    
  end
  
end
