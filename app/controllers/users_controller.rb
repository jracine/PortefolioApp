class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]

  def new
  	@user = User.new
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
end
