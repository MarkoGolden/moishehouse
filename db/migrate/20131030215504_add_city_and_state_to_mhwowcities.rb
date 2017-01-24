class AddCityAndStateToMhwowcities < ActiveRecord::Migration
  def change
    add_column :mhwowcities, :city, :string
    add_column :mhwowcities, :state, :string
  end
end
