class Receipt < ActiveRecord::Base
  attr_accessible :amount, :approved_date, :approver_id, :budget_id, :description, :grant_id, :house_id
  attr_accessible :perishable, :program_id, :purchaser_id, :receipt_file_name, :reject_reason, :status, :submitter_id
  attr_accessible :receipt, :created_at, :closed, :purchase_date, :staff, :conference, :approved_date
  attr_accessible :staff, :conference, :payperiod_id, :retreat, :kevin, :id, :purpose_id
  belongs_to :program
  belongs_to :house
  belongs_to :grant
  belongs_to :budget
  belongs_to :payperiod
  belongs_to :purpose
  belongs_to :submitter, :class_name => "User", :foreign_key => "submitter_id"
  belongs_to :purchaser, :class_name => "User", :foreign_key => "purchaser_id"
  belongs_to :approver, :class_name => "User", :foreign_key => "approver_id"
    
  has_attached_file :receipt, :default_url => "missing.png"

  validates_presence_of :program_id, :status, :submitter_id, :purchaser_id, :purpose_id

  validates :amount, :numericality => { :greater_than => 0 }, :presence => true
  
  def status_name
    if self.status == "1"
      "Submitted"
    elsif self.status == "2"
      "Approved"
    elsif self.status == "3"
      "Rejected"
    end
  end

  def status_name_html
    if self.status == "1"
     "<span class='label label-info'>Submitted</span>" 
    elsif self.status == "2"
     "<span class='label label-success'>Approved</span>" 
    elsif self.status == "3"
     "<span class='label label-important'>Rejected</span>" 
    end
  end

  def row_color
    if self.status == "1"
     "info" 
    elsif self.status == "2"
     "success" 
    elsif self.status == "3"
     "error" 
    end
  end
  
  def button_color
    if self.status == "1"
     "btn btn-small btn-primary" 
    elsif self.status == "2"
      "btn btn-small btn-success"
    elsif self.status == "3"
      "btn btn-small btn-danger"
    end
  end
  
  def receipt_legacy
    if self.receipt.to_s == "missing.png"
      "http://moishehouse.org/data/receipts/#{self.id}.jpg"
    else
      self.receipt
    end
  end  

  # def self.search(search)
  #   if search
  #     where('submitter_id: ?', "%#{search.to_i}%")
  #   else
  #     scoped
  #   end
  # end
end
