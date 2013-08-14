class CreateKnownConditions < ActiveRecord::Migration
  def change
    create_table :known_conditions do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
