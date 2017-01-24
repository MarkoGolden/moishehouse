class AddActiveToGrants < ActiveRecord::Migration
  def change
    add_column :grants, :active, :boolean
  end
end
