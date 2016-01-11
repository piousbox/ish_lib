
require 'spec_helper'

describe User do

  before :each do
    User.clear
    @user = FactoryGirl.create :user
  end

  describe 'Normal' do
    it 'creates newsitem' do
      u = @user
      newsitem = Newsitem.new :photo => Photo.new, :descr => 'simple descr'
      u.create_newsitem :photo => newsitem
      u.save.should eql true
    end
  end

  it '#generate_auth_token' do
    u = User.new
    result = u.generate_auth_token
    result.should_not eql nil
    result.class.name.should eql 'String'
  end
  
end

