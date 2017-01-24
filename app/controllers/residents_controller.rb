class ResidentsController < ApplicationController
  include PhotoFunctions
  #yep i know i broke REST :) I hate REST for limited stuff like this.  you might want to refactor this section soon.
  layout "mintranet"
  
  def index
    @user = current_user
  end

  def myinfo
    @user = current_user
  end

  def myinfosubmit
    params[:user][:password_confirmation] = params[:user][:password]
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end   
    myinfo_find_user 
  end

  def myinfo_find_user
    @user = User.find_by_email(params[:user][:email])
    @user.update_attributes!(params[:user])
    sign_in @user, :bypass => true
    redirect_to residents_myinfo_path, :notice => "User info successfully updated!"
  end

  def upcoming_programs
    @programs = Program.where("mhwow = true AND date > ?", 0.days.ago).order("date DESC")
    if params[:daysago]
      @daysago = params[:daysago].to_i
    else
      @daysago = 10
    end
  end

  def contacts
    @houses = House.where("active = true and id NOT IN(11,84)").order("city")
    # Consider making this list look like the old mintranet, with sections split by house cities
    @residents = User.where("active = true and house_id NOT IN (11,84)").order("last_name")
    @alumni = User.where("active = false and house_id NOT IN (11,84)").order("last_name")
    @mhwow = User.where("house_id = 84 and active = true").order("last_name")
    @staff = User.where("role = 'admin' and active = true").order("last_name")
    @board = User.where("board = true and active = true").order("last_name")
    @all = User.where("active = true").order("last_name")
  end

  def programs
    @programs = Program.where("house_id = ?", current_user.house_id).order("created_at DESC").limit(50)
    @user = current_user
    if params[:daysago]
      @daysago = params[:daysago].to_i
    else
      @daysago = 10
    end
  end
  
  def programs_new
    @program_types = ProgramType.where("id IN(1,2,3,12)")
    @program = Program.new
    5.times {@program.assets.build}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end    
  end  

  def programs_create
    @program = Program.create(params[:program])
    logger.debug(params[:program].inspect)

    # params[:program_photos].each do |p|
    #   ProgramPhoto.create(program_id: @program.id)
    # end

    @program.house_id = current_user.house_id
    @program.submitter_id = current_user.id    
    @program.save!
    redirect_to residents_programs_path
  end

  def programs_edit
    @program = Program.find(params[:id])
    @submitter = User.find(@program.submitter_id).firstlast
    5.times {@program.assets.build}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end
  end

  def programs_update
    @program = Program.find(params[:program][:id])    
    # if @program.attachments != nil
    #   @program.attachments << params[:file] 
    # end    
    @program.update_attributes(params[:program])
    redirect_to residents_programs_path, :notice => "Program successfully updated!"        
  end

  def programs_destroy
    @program = Program.find(params[:id])    
    @program.destroy
      respond_to do |format|
        format.html { redirect_to residents_programs_path }
        format.json { head :no_content }
      end    
  end  

  def receipts
    if params[:daysago]
      @daysago = params[:daysago].to_i
    else
      @daysago = 30
    end
  end

  def receipts_edit
    @receipt = Receipt.find(params[:id])
    if @receipt.house_id != current_user.house_id
      redirect_to residents_receipts_path
    end
  end

  def receipts_update
    @receipt = Receipt.find(params[:receipt][:id])
    @receipt.update_attributes!(params[:receipt])
    redirect_to residents_receipts_path, :notice => "Updated!"
  end

  def receipts_new
    @receipt = Receipt.new
    @program = Program.where("house_id = ?", current_user.house_id).order("date").limit(50)
  end

  def receipts_create
    @receipt = Receipt.new(params[:receipt])
    @receipt.status = "1"
    @receipt.submit_date = Time.now
    if @receipt.save!
      redirect_to residents_programs_path, :notice => "Receipt succesfully uploaded!"
    else
      flash.now[:error] = "Failed to upload!"    
      redirect_to receipts_edit_path
    end
  end

  # def budget
  #   @start_date = params[:start_date] ||= Date.today.beginning_of_month.strftime("%m-%d-%Y")
  #   @end_date = params[:end_date] ||= (Date.today.beginning_of_month + 1.month).strftime("%m-%d-%Y")
  #   @start_date = Date.strptime @start_date, '%m-%d-%Y' 
  #   @end_date = Date.strptime @end_date, '%m-%d-%Y'
  # end  

  def receipts_destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy    
    redirect_to residents_receipts_path, :notice => "Receipt Deleted"    
  end


end
