class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:notice] = "The User is successfully saved!"
			session[:current_user_id] = @user.id
			render "show"
		else
			render "new"
		end
	end

	def show
		if current_user
			@user = User.find(params[:id])
		else
			redirect_to new_session_path
		end
	end

end