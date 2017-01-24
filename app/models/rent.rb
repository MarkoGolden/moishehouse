class Rent < ActiveRecord::Base
  attr_accessible :adjustment, :house_id, :notes, :payment_date, :amount, :payperiod_id
  
  belongs_to :payperiod
  belongs_to :house
end
