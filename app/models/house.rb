class House < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :city, use: :slugged

  attr_accessible :active, :brn, :budget_cleaning, :budget_program, :calendar, :city, :contact_email
  attr_accessible :contact_phone, :country, :mail_address, :mail_city, :mail_instructions, :mail_international
  attr_accessible :mail_state, :mail_zip, :opened_date, :monthly_programs_id, :region, :rent_address, :rent_city
  attr_accessible :rent_instructions, :rent_name, :rent_name_on_check, :rent_state, :rent_subsidy, :rent_total 
  attr_accessible :director_id, :rent_zip, :rsj, :state, :web_description, :website, :avatar, :avatar_file_name, :featured, :combinechecks, :brn_budget

 validates_presence_of :city, :state

  has_many :programs
  has_many :users
  has_many :receipts 
  has_many :residents, :class_name => "User"  
  has_attached_file :avatar, :default_url => "missing.png"

  def slug_candidates
    [
      :city#,
      #[:city, :name],
      #[:name, :street, :city],
      #[:name, :street_number, :street, :city]
    ]
  end

  def city=(city)
    write_attribute(:city, city.strip.titleize.gsub(" Dc", " DC").gsub(" Rsj", " RSJ"))  
  end

  def one_month_range
    @start_date = (Date.today.beginning_of_month).strftime("%m-%d-%Y")
    @end_date = (Date.today.end_of_month).strftime("%m-%d-%Y")
    @start_date = Date.strptime @start_date, '%m-%d-%Y' 
    @end_date = Date.strptime @end_date, '%m-%d-%Y'
  end

  def two_months_range
    @start_date = (Date.today.beginning_of_month - 2.months).strftime("%m-%d-%Y")
    @end_date = (Date.today.end_of_month - 2.months).strftime("%m-%d-%Y")
    @start_date = Date.strptime @start_date, '%m-%d-%Y' 
    @end_date = Date.strptime @end_date, '%m-%d-%Y'
  end

  def next_month_range
    @start_date = Date.today.beginning_of_month.strftime("%m-%d-%Y")
    @end_date = (Date.today.beginning_of_month + 1.month).strftime("%m-%d-%Y")
    @start_date = Date.strptime @start_date, '%m-%d-%Y' 
    @end_date = Date.strptime @end_date, '%m-%d-%Y'
  end

  def previous_month_range
    @start_date = (Date.today.beginning_of_month - 1.month).strftime("%m-%d-%Y")
    @end_date = Date.today.beginning_of_month.strftime("%m-%d-%Y")
    @start_date = Date.strptime @start_date, '%m-%d-%Y' 
    @end_date = Date.strptime @end_date, '%m-%d-%Y'
  end

  def previous_month_receipts
    previous_month_range
    self.receipts.where('purpose_id = ? AND status = ? AND submit_date >= ? AND submit_date <= ?', 1, 2, @start_date, @end_date)
  end

  def calculate_two_months_receipts    
    two_months_range    
    two_months_ago_receipts = self.receipts.where('purpose_id = ? AND status = ? AND submit_date >= ? AND submit_date <= ?', 1, 2, @start_date, @end_date)    
    total = 0
    two_months_ago_receipts.map { |i| total += i.amount }
    @two_months_ago_total = total.to_i
  end  

  def calculate_rollover
    two_months_range
    @budget = self.budget_program
    two_months_ago_receipts = self.receipts.where('purpose_id = ? AND status = ? AND submit_date >= ? AND submit_date <= ?', 1, 2, @start_date, @end_date)    
    total = 0
    two_months_ago_receipts.map { |i| total += i.amount }
    @two_months_ago_total = total.to_i
    @rollover = @budget - total
  end     

  def calculate_new_budget
    two_months_range
    @budget = self.budget_program
    two_months_ago_receipts = self.receipts.where('purpose_id = ? AND status = ? AND submit_date >= ? AND submit_date <= ?', 1, 2, @start_date, @end_date)    
    total = 0
    two_months_ago_receipts.map { |i| total += i.amount }
    @two_months_ago_total = total.to_i
    @rollover = @budget - total
    @new_budget = @budget + @rollover
    self.budget_program = @new_budget
  end

  def current_receipts(purpose_id, status)
    one_month_range
    current_receipts = self.receipts.where('purpose_id = ? AND status = ? AND submit_date >= ? AND submit_date <= ?', purpose_id, status, @start_date, @end_date)
    total = 0 
    current_receipts.map {|i| total += i.amount }
    total
  end

  def current_month_receipts    
    current_receipts(1,2)    
  end

  def current_cleaning_budget_receipts
    current_receipts(6,2)
  end  

  def last_receipts
    next_month_range
    self.receipts.where('purpose_id = ? AND status = ? AND submit_date >= ? AND submit_date <= ?', 1, 2, @start_date, @end_date)
  end

  def programs_per_month
    p = read_attribute(:monthly_programs_id)
    output = case p.to_i
      when 1 then "3-4 Programs/Month"
      when 2 then "5-6 Programs/Month"
      when 3 then "7+ Programs/Month"
      else "error"
    end
  end

  def location
    if self.id == 11
      "Staff"
    elsif self.id == 84
      "MH:WOW"
    elsif self.id == 7
      "Washington, DC"
    else
      "#{self.city}, #{self.state}"
    end
  end
  
  def address_full
    "#{self.mail_address}, #{self.mail_city}, #{self.mail_state}, #{self.mail_zip}"
  end  

  #these are old methods from the previous programmer that i'm keeping for reference while this is built out
  # def current_budget_house(date = Date.today)
  #   mydate = date.to_date
  #   total = self.budget_program
  #   receipts = self.receipts.where("submit_date > ? and submit_date < ? and purpose_id = 1", mydate.beginning_of_month, mydate.end_of_month)
  #   receipts.map {|i| total -= i.amount}
  #   "$" + total.round(2).to_s + " out of $"+ self.budget_program.to_s + " left for: " + mydate.beginning_of_month.strftime("%D") + " to " + mydate.end_of_month.strftime("%D")
  # end

  # def current_budget_cleaning(date = Date.today)
  #   mydate = date.to_date
  #   total = self.budget_cleaning ||= 300
  #   receipts = self.receipts.where("submit_date > ? and submit_date < ? and purpose_id = 6", mydate.beginning_of_month, mydate.end_of_month)
  #   receipts.map {|i| total -= i.amount}
  #   "$" + total.round(2).to_s + " out of $" + (self.budget_cleaning ||=300).to_s + " left for: " + mydate.beginning_of_month.strftime("%D") + " to " + mydate.end_of_month.strftime("%D")
  # end  

  # def current_budget_cleaning_receipts(date = Date.today)
  #   mydate = date.to_date
  #   total = self.budget_cleaning ||= 300
  #   receipts = self.receipts.where("submit_date > ? and submit_date < ? and purpose_id = 6", mydate.beginning_of_month, mydate.end_of_month)
  # end

  # def current_budget_house_receipts(date = Date.today)
  #   mydate = date.to_date
  #   total = self.budget_program
  #   receipts = self.receipts.where("submit_date > ? and submit_date < ? and purpose_id = 1", mydate.beginning_of_month, mydate.end_of_month)
  # end
end
