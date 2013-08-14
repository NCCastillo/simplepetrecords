class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date   :date
      t.string :description
      t.string :veterinarian
      t.string :diagnosis
      t.string :notes

      t.timestamps
    end
end
