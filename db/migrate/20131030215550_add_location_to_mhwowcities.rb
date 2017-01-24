class AddLocationToMhwowcities < ActiveRecord::Migration
  def change
    add_column :mhwowcities, :location, :string
  end
end
