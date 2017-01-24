class RenameBlahInPrograms < ActiveRecord::Migration
  def change
    rename_column :programs, :event_type_id, :purpose_type
  end

end
