class PetInfo < ActiveRecord::Migration
  def change
  	create_table :pet_info do |t|
  		t.string :name
  		t.string :gender
  		t.string :breed
  		t.string :color
  		t.string :weight
  		t.string :license
  		t.string :microchip
  		t.string :species
  		t.string :rabies_id
  		t.string :neutered   

  	end
  end
end
