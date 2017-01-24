class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :house_id
      t.integer :program_id
      t.integer :submitter_id
      t.integer :purchase_id
      t.decimal :amount
      t.integer :grant_id
      t.text :description
      t.boolean :perishable
      t.integer :budget_id
      t.string :status
      t.integer :approver_id
      t.datetime :approved_date
      t.text :reject_reason
      t.string :receipt_file_name

      t.timestamps
    end
  end
end
