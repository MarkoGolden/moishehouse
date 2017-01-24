class Payperiod < ActiveRecord::Base
  attr_accessible :date, :locked, :locked_rent
  has_many :receipts
  has_many :rents
  
end
