class MedicationsController < ApplicationController

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(params[:medication])
    @pet = Pet.find_by_id(params[:pet_id])
    @medication.pet_id = @pet.id

    if @medication.save
      flash[:notice] = "Medication record saved"
      redirect_to user_pet_path(@pet.user, @pet)
    else
      flash[:notice] = "Something went wrong. Please try again"
      render "new"
    end

  end

  def edit
    @medication = Medication.find_by_id(params[:id])
  end

  def update
    @medication = Medication.find_by_id(params[:id])

    if @medication.update_attributes(params[:medication])
      redirect_to user_pet_path(@medication.pet.user, @medication.pet)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render "edit"
    end
  end

  def destroy
    @medication = Medication.find_by_id(params[:id])
    @medication.destroy
    redirect_to user_pet_path(@medication.pet.user, @medication.pet)
  end

end