class AddProgramCityToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :program_city, :string
  end
end
