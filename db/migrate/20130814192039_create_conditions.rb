class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string  :name
      t.string  :description
      t.integer :pet_id

      t.timestamps
    end
  end
end
