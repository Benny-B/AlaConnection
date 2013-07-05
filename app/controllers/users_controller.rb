class UsersController < ApplicationController

	before_filter :signed_in_user, :only => [:edit, :index, :update, :show]
	before_filter :correct_user, :only => [:edit, :update]


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
  	@users = User.all
  end

  def update
  	@user = User.find(params[:id])
  	@user.latitude = params[:user][:latitude]
  	@user.longitude = params[:user][:longitude]
  

  	if @user.save
  		flash[:success] = "Profile updated"
  		sign_in @user
  		redirect_to @user
  	else
  		Rails.logger.info(@user.errors.messages.inspect)
  		redirect_to "/"
  	end
  end


  private
  	def signed_in_user
  		unless signed_in?
  			redirect_to "/signin"
  			flash[:notice] = "Please, sign in"
  		end
  	end

  	def correct_user
  		@user = User.find(params[:id])
  		unless current_user?(@user)
  			redirect_to "/"
  		end
  	end



end
