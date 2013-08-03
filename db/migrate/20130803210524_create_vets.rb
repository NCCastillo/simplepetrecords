class CreateVets < ActiveRecord::Migration
  def change
  	create_table :vets do |t|
  		t.string :name
  		t.string :phone1
  		t.string :phone2
  		t.integer :pet_id

  		t.timestamps
  	end
  end
end
