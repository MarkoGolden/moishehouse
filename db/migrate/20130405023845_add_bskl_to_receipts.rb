class AddBsklToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :closed, :boolean
    add_column :receipts, :purchase_date, :date
    add_column :receipts, :staff, :boolean
    add_column :receipts, :conference, :string
    add_column :receipts, :approve_date, :datetime
  end
end
