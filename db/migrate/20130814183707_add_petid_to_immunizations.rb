class AddPetidToImmunizations < ActiveRecord::Migration
  def change
    add_column :immunizations, :pet_id, :integer
  end
end
