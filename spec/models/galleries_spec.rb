
require 'spec_helper'

describe Gallery do

  before :each do
    Gallery.all.each { |u| u.remove }

    setup_sites
    
    User.all.each { |u| u.remove }
    @user = FactoryGirl.create :user
  end

  describe 'galleries' do
    it 'saves username' do
      g = Gallery.new :name => 'asdf', :galleryname => 'wrgbdsfg', :user => @user, :site => @site
      flag = g.save
      unless flag
        puts! g.errors, 'these errors saving a gallery'
      end
      flag.should eql true
      g.username.should_not eql nil
      g.username.should eql @user.username
    end
  end

  describe 'actions' do
    it 'has the list of actions, or templates' do
      Gallery.actions.should eql [ 'show_mini', 'show_long', 'show' ]
    end
  end

  describe 'AppModel2 stuff here' do
    it 'lists' do
      Gallery.list.should_not eql nil
    end
  end
  
end
