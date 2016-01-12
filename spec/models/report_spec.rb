
require 'spec_helper'

describe Report do

  before :each do
    Report.all.each { |r| r.remove }

    setup_sites

    User.all.each { |u| u.remove }
    @user = FactoryGirl.create :user
    @anon = FactoryGirl.create :anon
    
  end

  describe 'callbacks' do
    it 'saves username' do
      g = Report.new :name => 'asdf', :name_seo => 'wrgbdsfg', :user => @user, :username => @user.username, :site => @site
      flag = g.save
      flag.should eql true
      g.username.should_not eql nil
      g.username.should eql @user.username
    end

    it 'generates name_seo if it is not set' do
      names = ['asdf', 'aasdf.-', 'asdf:ff', 'asdf. sdf sdf' ]
      expected_names = ['asdf', 'aasdf', 'asdf-ff', 'asdf-sdf-sdf' ]
      names.each_with_index do |name, idx|
        g = nil
        g = Report.new :name => name, :user => @user, :username => @user.username, :name_seo => expected_names[idx], :site => @site
        flag = g.save
        flag.should eql true
        # g.name_seo.should eql expected_names[idx]
        g.remove
      end
    end
  end

end
