class ImmunizationsController < ApplicationController

    def new
      @immunization = Immunization.new
    end

    def create
      @pet = Pet.find_by_id(params[:pet_id])
      @immunization = Immunization.new(params[:immunization])
      @immunization.pet_id = @pet.id 
      
      if @immunization.save
        flash[:notice] = "Immunization record saved"
        redirect_to user_pet_path(@pet.user, @pet)
      else
        flash[:notice] = "Something went wrong. Please try again"
        render "new"
      end

    end

    def edit
      @immunization = Immunization.find_by_id(params[:id])
    end

    def update
      @immunization = Immunization.find_by_id(params[:id])

      if @immunization.update_attributes(params[:immunization])
        redirect_to user_pet_path(@immunization.pet.user, @immunization.pet)
      else
        flash[:notice] = "Something went wrong. Please try again."
        render "edit"
      end

    end

    def destroy
      @immunization = Immunization.find_by_id(params[:id])
      @immunization.destroy
      redirect_to user_pet_path(@immunization.pet.user, @immunization.pet)
    end
end