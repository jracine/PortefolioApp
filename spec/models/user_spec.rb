require 'spec_helper'

describe User do

	before (:each) do
		@attr = {:email=> "user@examble.com", :password => "test", :password_confirmation=>"test"}
	end
	 
	it "should create a new instance given valid attributes" do
    	User.create!(@attr)
  	end

  	it "should require an email" do
    	no_email_user = User.new(@attr.merge(:email => ""))
    	no_email_user.should_not be_valid
  	end

  	it "should require a password" do
    	no_password_user = User.new(@attr.merge(:password => ""))
    	no_password_user.should_not be_valid
  	end

end
