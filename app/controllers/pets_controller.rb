class PetsController < ApplicationController

	def new
		@user = User.find_by_id(params[:user_id])
		@pet = Pet.new
	end

	def create
		petowner = User.find_by_id(params[:user_id])
		pet = Pet.new(params[:pet])
		pet.user = petowner
		if pet.save 
			flash[:notice] = "Your pet has been saved!"
			redirect_to user_path(petowner)
		else
			flash[:notice] = "Something went wrong. Please try again."
			redirect_to new_user_pet_path(petowner)
		end
	end

	def show
		@pet = Pet.find_by_id(params[:id])
	end

	def edit
		@user = User.find_by_id(params[:user_id])
		@pet = @user.pets.find_by_id(params[:id])
	end

	def update
		user = User.find_by_id(params[:user_id])
		@pet = Pet.find_by_id(params[:id])
		if @pet.update_attributes(params[:pet])
			flash[:notice] = "Update was successful"
			redirect_to user_pet_path(user, @pet)
		else
			flash[:notice] = "Something went wrong. Please try again."
			render "edit"
		end
	end

end