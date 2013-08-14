class AddPetidToMedications < ActiveRecord::Migration
  def change
    add_column :medications, :pet_id, :integer
  end
end
