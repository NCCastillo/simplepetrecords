class PetsController < ApplicationController

	def new
		@user = User.find_by_id(params[:user_id])
		@pet = Pet.new
	end

	def create
		dogowner = User.find_by_id(params[:user_id])
		pet = Pet.new(params[:pet])
		pet.user = dogowner
		if pet.save 
			flash[:notice] = "Your pet has been saved!"
			#pet.user = dogowner
			redirect_to user_path(dogowner)
		else
			flash[:notice] = "Something went wrong. Please try again."
			redirect_to new_user_pet_path(dogowner)
		end
	end

end