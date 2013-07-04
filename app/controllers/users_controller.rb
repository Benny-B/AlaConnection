class UsersController < ApplicationController


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save 
  		sign_in @user
  		flash[:succes] = "Welcome to ALAcon"
  		redirect_to @user
  	else
  		render :action => "new"
  	end
  end

  def show
  	@user = User.find(params[:id]) 
  end

  def update
  	@user = User.find(params[:id]);
  	@user.latitude = params[:user][:latitude]
  	@user.longitude = params[:user][:longitude]

  	if @user.save
  		flash[:success] = "Profile updated"
  		sign_in @user
  		redirect_to @user
  	else
  		redirect_to "/"
  	end
  end
end
