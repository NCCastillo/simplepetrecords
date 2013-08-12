class VetsController < ApplicationController
	def new
		@vet = Vet.new
		@vet.build_address
	end

	def create
		@vet = Vet.new(params[:vet])
		pet = params[:pet_id]
		user = params[:user_id]

		if @vet.save
			flash[:notice] = "Vet info saved"
			redirect_to user_pet_path(user,pet)
		else
			flash[:notice] = "Something went wrong please try again."
			render "new"
		end
	end

	def edit
		pet = Pet.find_by_id(params[:pet_id])
		@vet = Vet.find_by_id(pet.vet.id)
	end

	def update
		@vet = Vet.find_by_id(params[:id])
		if @vet.update_attributes(params[:vet])
			flash[:notice] = "Update was successful"
			redirect_to user_pet_path(@vet.pet.user_id, @vet.pet)
		else
			flash[:notice] = "Something went wrong. Please try again."
			render "edit"
		end
	end
end