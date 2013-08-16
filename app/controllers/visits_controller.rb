class VisitsController < ApplicationController
  
  def new
    @visit = Visit.new
  end

  def create
    pet = Pet.find_by_id(params[:pet_id])

    if pet.visits << Visit.new(params[:visit])
      flash[:notice] = "Visit saved"
      redirect_to user_pet_path(pet.user, pet)
    else
      flash[:notice] = "Something went wrong. Please try again"
      render "new"
    end
    
  end

  def edit
    @visit = Visit.find_by_id(params[:id])
  end

  def update
    visit = Visit.find_by_id(params[:id])

    if visit.update_attributes(params[:visit])
      redirect_to user_pet_path(visit.pet.user, visit.pet)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render "edit"
    end

  end

  def destroy
    visit = Visit.find_by_id(params[:id])
    visit.destroy
    redirect_to user_pet_path(visit.pet.user, visit.pet)
  end
end