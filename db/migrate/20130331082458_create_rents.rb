class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.integer :house_id
      t.decimal :subsidy
      t.decimal :adjustment
      t.text :notes
      t.date :payment_date

      t.timestamps
    end
  end
end
