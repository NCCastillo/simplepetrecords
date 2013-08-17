class ChangeTypeInImmunizations < ActiveRecord::Migration
  def up
    rename_column :immunizations, :type, :itype
  end

  def down
    rename_column :immunizations, :itype, :type 
  end
end
