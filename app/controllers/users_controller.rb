class UsersController < ApplicationController

	before_filter :save_login_state, :only => [:new, :create]

	def new
		#Signup Form
		@user = Users.new     
	end

	def create
		@user = Users.new(params[:user])
		if @user.save
			flash[:notice] = "You Signed up successfully"
			flash[:color]= "valid"
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
		end
		render "new"
	end
	
	private
	
	def users_params
		params.require(:users).permit(:username, :email, :password, :password_confirmation)
	end

end
