class AddAmountRemainingAndToGrants < ActiveRecord::Migration
  def change
  	add_column :grants, :amount_remaining, :decimal
  end
end
