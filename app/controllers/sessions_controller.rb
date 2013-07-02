class SessionsController < ApplicationController


		def new 

		end

		def create
			@user = User.find_by_email(params[:session][:email].downcase)
			@password = params[:session][:password]
			if @user
				if BCrypt::Password.new(@user.hashed_password).is_password?@password
				#sign_in
				redirect_to @user
				else
					#flash.now[:error] = "Invalid email/password"
					render :action => "new"
				end
			else
				#flash.now[:error] = "Invalid email/password"
				render :action => "new"
			end

		end

		def destroy

		end

end