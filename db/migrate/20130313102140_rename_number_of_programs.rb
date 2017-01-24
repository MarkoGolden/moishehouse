class RenameNumberOfPrograms < ActiveRecord::Migration
  def up
    rename_column :houses, :programs_per_month, :monthly_programs_id
  end

  def down
    rename_column :houses, :monthly_programs_id, :programs_per_month
  end
end
