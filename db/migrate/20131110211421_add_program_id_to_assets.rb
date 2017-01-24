class AddProgramIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :program_id, :integer
  end
end
