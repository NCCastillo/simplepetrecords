class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date     :date
      t.string   :description
      t.string   :veterinarian
      t.string   :diagnosis
      t.string   :notes
      t.integer  :pet_id

      t.timestamps
    end
  end
end
