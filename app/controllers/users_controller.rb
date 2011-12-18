class UsersController < ApplicationController

  before_filter :authenticate, :only => [:show, :destroy]
  before_filter :correct_user, :only => [:show, :destroy]

  def new
  	@user = User.new
    @title = "Sign Up"
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to root_url, :notice=>"Signed up!"
  	else
  		render "new"
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@images = @user.images
  end

  def destroy
  	@user = User.find(params[:id])
  	
  	if @user.destroy
  	  reset_session
  	  redirect_to root_url, :notice=> "The account has been destroyed !" 
  	else
  	  redirect_to root_url, :notice=> "No destruction"	
  	end
  end

   private
    
    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
