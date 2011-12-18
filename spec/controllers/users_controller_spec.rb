require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end

#Ici, :show a la même valeur que 'show'
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

#Ici, rails converti automatiquement @user en sont id
#Équivalent à :id => @user.id
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Sign up")
    end
  end
end
