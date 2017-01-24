class CreateMonthlyPrograms < ActiveRecord::Migration
  def change
    create_table :monthly_programs do |t|
      t.string :description

      t.timestamps
    end
  end
end
