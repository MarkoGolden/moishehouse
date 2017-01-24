class AddMhwowcityToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :mhwowcity_id, :integer
  end
end
