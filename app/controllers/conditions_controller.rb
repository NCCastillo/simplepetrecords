class ConditionsController < ApplicationController

  def new
    @condition = Condition.new
  end

  def create
    @pet = Pet.find_by_id(params[:pet_id])
    @condition = Condition.new(params[:condition])
    @condition.pet_id = @pet.id 

    if @condition.save
      flash[:notice] = "Immunization record saved"
      redirect_to user_pet_path(@pet.user, @pet)
    else
      flash[:notice] = "Something went wrong. Please try again"
      render "new"
    end

  end

  def edit
    @condition = Condition.find_by_id(params[:id])
  end

  def update
    @condition = Condition.find_by_id(params[:id])

    if @condition.update_attributes(params[:condition])
      redirect_to user_pet_path(@condition.pet.user, @condition.pet)
    else
      flash[:notice] = "Something went wrong. Please try again."
      render "edit"
    end

  end

  def destroy
    @condition = Condition.find_by_id(params[:id])
    @condition.destroy
    redirect_to user_pet_path(@condition.pet.user, @condition.pet)
  end
end