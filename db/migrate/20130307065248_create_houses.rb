class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.date :opened_date
      t.string :city
      t.string :state
      t.string :country
      t.string :region
      t.text :web_description
      t.boolean :brn
      t.boolean :rsj
      t.string :mail_address
      t.string :mail_city
      t.string :mail_state
      t.string :mail_zip
      t.text :mail_instructions
      t.boolean :mail_international
      t.string :contact_phone
      t.string :contact_email
      t.string :website
      t.string :calendar
      t.string :rent_name
      t.string :rent_address
      t.string :rent_city
      t.string :rent_state
      t.string :rent_zip
      t.text :rent_instructions
      t.string :rent_name_on_check
      t.string :programs_per_month
      t.float :rent_total
      t.float :rent_subsidy
      t.float :budget_program
      t.float :budget_cleaning
      t.boolean :active

      t.timestamps
    end
  end
end
