class Grant < ActiveRecord::Base
  attr_accessible :amount, :description, :expires, :name, :active, :amount_remaining
  validates_presence_of :name, :description, :amount, :expires
  
  def rowcolor
    if Time.now > self.expires
      "warning"
    elsif Time.now < self.expires
      "success"
    else
      "error"
    end
  end

  def self.get_amount_remaining
    grant_receipt = Receipt.where(grant_id: "#{self.id}")
    amount_used = grant_receipt.amount.to_i
    self.amount_remaining = self.amount.to_i - amount_used
  end
end
