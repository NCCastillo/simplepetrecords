class CreateImmunizations < ActiveRecord::Migration
  def change
    create_table :immunizations do |t| 
      t.string :type
      t.date   :date
      t.date   :next_due

      t.timestamps
    end
  end  
end
