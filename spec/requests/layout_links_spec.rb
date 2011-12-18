require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have an Signup page at '/sign_up'" do
    get '/sign_up'
    response.should have_selector('title', :content => "Sign Up")
  end
  
  it "should have a Log in page at '/log_in'" do
    get '/log_in'
    response.should have_selector('title', :content => "Log in")
  end

  it "should have a Log out page at '/log_out'" do
    get '/log_out'
    response.should have_selector('title', :content => "Log out")
  end
end
