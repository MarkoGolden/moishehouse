class ProgramsController < ApplicationController
  include PhotoFunctions
  before_filter :authenticate_user!, :except => [:_approve]
  #before_filter :authorize
  layout "mintranet"

  def index    
    date_range_for_index
    @houses_all = House.all
    @us_houses = House.where("region LIKE ?", 'US%').order(params[:sort])
    @intl_houses = House.where("region NOT LIKE ? and id NOT IN(?)", 'US%', [11,84])
    @selected_houses = params[:house_id]
    program_stats    
  end

  def new
    @program = Program.new
  end

  def edit
    @program = Program.find(params[:id])
    @program_types = ProgramType.where("id IN(?)", [1,2,3,12])     
  end

  def create    
    @program = Program.new(params[:program])    
    @program.save!
    redirect_to @program  
  end

  def update
    @program = Program.find(params[:program][:id])
    @program.update_attributes!(params[:program])    
    redirect_to :back, notice: 'Program was successfully updated.'    
  end

  def destroy
    @program = Program.find(params[:id])
    if @program.mhwow = true
      @program.destroy
      respond_to do |format|
        format.html { redirect_to programs_mhwow_path }
        format.json { head :no_content }
      end
    else
      @program.destroy
      respond_to do |format|
        format.html { redirect_to programs_index_path }
        format.json { head :no_content }
      end
    end
  end

  def _approve
    user = User.find(params[:user_id].to_i)
    program = Program.find(params[:program_id])
    program.status = "Approved"
    program.save
    UserMailer.mhwow_programs_approved(user).deliver
    render :json => {:status => :ok}
  end 

  def _update_status
    program = Program.find(params[:program_id])
    if params[:status] == "1"
      program.status = "Submitted"
    elsif params[:status] == "2"
      program.status = "Declined"
    end

    program.save
    render :json => {:status => :ok}
  end

  def daysago
    if params[:daysago]
      @daysago = params[:daysago].to_i
    else
      @daysago = 10
    end
  end

  # this whole action needs to be re-factored, or maybe put into its own controller altogether, with programs as resources
  def mhwow
    date_range_for_mhwow
    @programs = Program.where("house_id = ?", 84).order("date DESC")
    @houses = House.where("id = ?", 84)    
    
    # all the cities that we classify as the San Diego area for MHWOW
    san_diego_array
    #filter search
    mhwow_filters
    # get program statistics
    mhwow_prog_stats
    # get status of each program i.e. approved, submitted, declined
    mhwow_prog_status(@programs)
    # check if program type is in the search params
    programquery
  end

  # excel reports
  
  def activity_report(array, operator)
    excel_date    
    array = Program.where("date >= ? AND date <= ? AND house_id '#{operator}' ?", 84, @start_date, @end_date).order('date ASC')    
    
  end

  def mhwow_activity
    activity_report(@mhwow_programs_excel, "=")
  end
  
  def export_activity
    logger.debug("hi----------------!!!")
    activity_report(@programs_excel, "<>") 
    respond_to do |format|
      format.html
      format.xlsx { render xlsx: "export_activity", disposition: "attachment", filename: "activity.xlsx" }
    end
  end

  private
  #this method needs to be re-thought. it leaves us open to sql injections.
  def programquery
    if params[:program_type_id] != "" && params[:program_type_id]
      programquery = " AND program_type_id = " + params[:program_type_id]
    else
      programquery = ""
    end
  end

  def set_program_total_defaults
    @progstats = {}
    @progstats[:receipts_submitted] = 0
    @progstats[:receipts_approved] = 0
    @progstats[:receipts_rejected] = 0
    @progstats[:attended_total] = 0
    @progstats[:attended_new] = 0
    @progstats[:attended_residents] = 0
    @progstats[:birthright_next_programs] = 0
    @progstats[:birthright_next_attended] = 0
    @progstats[:culture_programs] = 0
    @progstats[:culture_attended] = 0
    @progstats[:learning_programs] = 0
    @progstats[:learning_attended] = 0
    @progstats[:repair_programs] = 0
    @progstats[:repair_attended] = 0
    @progstats[:social_programs] = 0
    @progstats[:social_attended] = 0
    @progstats[:program_count] = 0
    @progstats[:partners] = 0
    @progstats[:direct_service] = 0
    @progstats[:largest] = 0
  end  

  def program_stats  
    programs = Program.where("date >= ? AND date <= ? AND attended_total IS NOT NULL" + programquery, @start_date, @end_date).order("date DESC")
    @programs = programs.all(:conditions => {:house_id => params[:house_id]})    
    @mhwow = Program.where("house_id = ? AND date > ? AND date < ?"  + programquery, 84, @start_date, @end_date).order("date ASC")
    #@partnered = Program.where("partner IS NOT NULL AND date > ? AND date < ?" + housequery + programquery, @start_date, @end_date).order("date ASC")
    #@birthright = Program.where("partner = 'Birthright NEXT' AND date > ? AND date < ?" + housequery + programquery, @start_date, @end_date).order("date ASC")

    #Refactor this maybe using "@#{variable}_stats".to_sym ------------------------------------------------
    set_program_total_defaults

    @programs.each do |p|      
      receipt_total_calc(p)
      @progstats[:attended_total] += p.attended_total
      @progstats[:attended_new] += p.attended_new if p.attended_new
      @progstats[:attended_residents] += p.attended_residents if p.attended_residents
      @progstats[:birthright_next_programs] += 1 if p.program_type_id == 9
      @progstats[:birthright_next_attended] += p.attended_total if p.program_type_id == 9
      @progstats[:culture_programs] += 1 if p.program_type_id == 1
      @progstats[:culture_attended] += p.attended_total if p.program_type_id == 1
      @progstats[:learning_programs] += 1 if p.program_type_id == 2
      @progstats[:learning_attended] += p.attended_total if p.program_type_id == 2
      @progstats[:repair_programs] += 1 if p.program_type_id == 3
      @progstats[:repair_attended] += p.attended_total if p.program_type_id == 3
      @progstats[:social_programs] += 1 if p.program_type_id == 4
      @progstats[:social_attended] += p.attended_total if p.program_type_id == 4
      @progstats[:program_count] += 1
      @progstats[:partners] += 1 if p.partner
      @progstats[:direct_service] += 1 if p.direct_service
      @progstats[:largest] = p.attended_total if p.attended_total > @progstats[:largest]
    end
      @progstats[:avg_per_program] = (@progstats[:attended_total].to_f / @progstats[:program_count].to_f).round(1)

      respond_to do |format|
        format.html
        format.csv { render text: @programs.to_csv }
      end
  end

  def set_mhwow_total_defaults
    @progstats = {}
    @progstats[:receipts_submitted] = 0
    @progstats[:receipts_approved] = 0
    @progstats[:receipts_rejected] = 0
    @progstats[:attended_total] = 0
    @progstats[:program_count] = 0
    @progstats[:largest] = 0
  end

  def mhwow_prog_stats
    # set program results totals
    set_mhwow_total_defaults

    # get program results totals based on the status of a receipt
    @programs.each do |p|
      receipt_total_calc(p)              
      #get the total attended if anyone has attended, then get the largest attendee total
      if p.attended_total != nil
        @progstats[:attended_total] += p.attended_total 
        @progstats[:largest] = p.attended_total if p.attended_total > @progstats[:largest]
      end
      # tally the program in program count
      @progstats[:program_count] += 1
    end
    # get the average number of attendees per program for a given search
    @progstats[:avg_per_program] = (@progstats[:attended_total].to_f / @progstats[:program_count].to_f).round(1)
  end

  def mhwow_filters
    # filter results based on selected group
    if params[:program_city] == "San Diego MHWOW"
      sd_filter      
    elsif params[:program_city] == "Alumni MHWOW"      
      alumni_filter
    else
      default_mhwow_filter      
    end
  end

  def alumni_filter
    @programs = Program.joins(:user).where("users.alumni = ? AND users.house_id = ? AND programs.mhwow = ? AND date >= ? AND date <= ?" + programquery, true, 84, true, @start_date, @end_date).order("date DESC")
    @sd_programs_count = Program.joins(:user).where("users.alumni = ? AND users.house_id = ? AND date >= ? AND date <= ? AND program_city IN (?)" + programquery, true, 84, @start_date, @end_date, @san_diego).size
    @alumni_programs_count = @programs.size
  end

  def sd_filter
    @programs = Program.where("house_id = ? AND mhwow = ? AND date >= ? AND date <= ? AND program_city IN (?)" + programquery, 84, true, @start_date, @end_date, @san_diego).order("date DESC")
    @sd_programs_count = Program.where("house_id = ? AND date >= ? AND date <= ? AND program_city IN (?)" + programquery, 84, @start_date, @end_date, @san_diego).size
    @alumni_programs_count = Program.joins(:user).where("users.alumni = ? AND users.house_id = ? AND programs.mhwow = ? AND date >= ? AND date <= ? AND program_city IN (?)" + programquery, true, 84, true, @start_date, @end_date, @san_diego).size
  end

  def default_mhwow_filter
    programs = Program.where("house_id = ? AND date >= ? AND date <= ?" + programquery, 84, @start_date, @end_date).order("date DESC")
    @programs = programs.all
    @alumni_programs_count = Program.joins(:user).where("users.alumni = ? AND users.house_id = ? AND date >= ? AND date <= ?" + programquery, true, 84, @start_date, @end_date).size     
    @sd_programs_count = Program.where("house_id = ? AND mhwow = ? AND date >= ? AND date <= ? AND program_city IN (?)" + programquery, 84, true, @start_date, @end_date, @san_diego).size
  end

  def mhwow_prog_status(programs)
    # get the status of a program
    programs.each do |p|            
      if p.status == "Submitted"
        p.status = "1"
      elsif p.status == "Approved"
        p.status = "2"        
      elsif p.status == "Declined"
        p.status = "3"
      end
      @program_status = p.status
    end 
  end  

  def date_range(start_date, end_date, format="%m-%d-%Y")
    @start_date = params[:start_date] ||= (start_date).strftime("%m-%d-%Y")
    @end_date = params[:end_date] ||= (end_date).strftime("%m-%d-%Y")
    @start_date = Date.strptime(@start_date, "#{format}")
    @end_date = Date.strptime(@end_date, "#{format}")
  end

  def excel_date
    date_range(Date.today.end_of_month, Date.today.end_of_month + 1.month, "%m-%d-%Y")
  end

  def date_range_for_index
    date_range(Date.today.beginning_of_month, Date.today.beginning_of_month + 1.month)    
  end

  def date_range_for_mhwow
    date_range(Date.today.beginning_of_month - 1.month, Date.today.beginning_of_month + 1.month)    
  end

  def receipt_total_calc(program)
    program.receipts.each do |r|
      @progstats[:receipts_submitted] += r.amount if r.status == "1" && r.purpose_id = 1 
      @progstats[:receipts_approved] += r.amount if r.status == "2" && r.purpose_id = 1
      @progstats[:receipts_rejected] += r.amount if r.status == "3" && r.purpose_id = 1
    end
  end
end