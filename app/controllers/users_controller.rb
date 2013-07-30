class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:notice] = "The User is successfully saved!"
			session[:current_user_id] = @user.id
			redirect_to root_path
		else
			render "new"
		end
	end

end