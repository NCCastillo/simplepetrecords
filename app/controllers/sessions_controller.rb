class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:current_user_id] = user.id
			redirect_to root_path
		else
			flash.now.notice = "Email or password is invalid"
			render "new"
		end
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to root_path
	end
end