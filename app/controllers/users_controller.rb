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

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		if @user.update_attributes(params[:user])
			render "show"
		else
			render "edit"
		end
	end

	def address
		@address = Address.new 
	end

	def address_create
		@user = User.find_by_id(params[:id])
		@user.address = Address.new(params[:address])

		if @user.address.save
			redirect_to user_path(@user)
		else
			render "edit"
		end
	end

	def address_edit
		user = User.find_by_id(params[:id])
		@address = user.address
	end

	def address_update
		@user = User.find_by_id(params[:id])
		if @user.address.update_attributes(params[:address])
			render "show"
		else
			render "address_edit"
		end
	end
end