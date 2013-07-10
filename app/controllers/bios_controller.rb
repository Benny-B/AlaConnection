class BiosController < ApplicationController
	before_filter :signed_in_user

	def new
		@bio = current_user.bios.build if signed_in?
	end

	def create
		@bio = current_user.bios.build(params[:bio])

		if @bio.save
			flash[:success] = "Bio created"
			redirect_to current_user
		else
			redirect_to "/"
		end
	end

	def show
		@bio = current_user.bios.first if signed_in?
	end

	def edit
		@bio = current_user.bios.build if signed_in?
	end

	def update
		@bio = current_user.bios.first if signed_in?

		if @bio.update_attributes(params[:bio])
			flash[:success] = "Bio Updated"
			redirect_to current_user
		else
			flash[:failed] = "Bio not updated"
			redirect_to "/"
		end

	end

	def destroy

	end


end
