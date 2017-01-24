class AddSubToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :submit_date, :datetime
  end
end
