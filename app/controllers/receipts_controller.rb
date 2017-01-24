class ReceiptsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize
  layout "mintranet"

  def index
    @user = Receipt.search(params[:search])
    @houses_all = House.where("active = true and id NOT IN (11,84)").order("city")    
    if params[:house_id] != ""
      @houses = House.where("active = TRUE AND id = ?", params[:house_id]).order("city")
    else
      @houses = @houses_all
    end

    if params[:payperiod_id] && !params[:payperiod_id] == ""
      payperiod_query = " AND payperiod_id = " + params[:payperiod_id]
    else
      payperiod_query = ""
    end
    
    if params[:daysago]
      @daysago = params[:daysago].to_i
    else
      @daysago = 10
    end    
  end  

  def mhwow
    @houses = House.where("id = ?", 84)
    mhwow_date    
    receipts = Receipt.joins(:program).where("programs.house_id = ? AND submit_date >= ? AND submit_date <= ?", 84, @start_date, @end_date).order("date DESC")
    @receipts = receipts.all
  end

  def show
    @receipt = Receipt.find(params[:receipt])
  end

  def new
    @receipt = Receipt.new
  end

  # def approve
  # end

  def daysago
    
  end

  def create
    @receipt = Receipt.new(params[:receipt])
    @receipt.submitter_id = current_user.id
    if @receipt.save!
      redirect_to receipts_index_path
    end
  end

  def edit
    @receipt = Receipt.find(params[:id])
  end
  
  def update
    @receipt = Receipt.find(params[:receipt][:id])
    @receipt.update_attributes!(params[:receipt])
    if params[:receipt][:status] == "2"
      @receipt.approver_id = current_user.id
      @receipt.approved_date = Time.now
      @receipt.reject_reason = ""
      @receipt.save!
    end
    if @receipt.submitter.role == "mhwow"
      redirect_to receipts_mhwow_path
    elsif
      session[:return_to]
      red = session[:return_to]
      session[:return_to] = nil
      redirect_to "#{red}"
    else
      redirect_to :back
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy

    respond_to do |format|
      format.html { redirect_to receipts_index_path }
      format.json { head :no_content }
    end
  end

  private
  def mhwow_date
    @start_date = params[:start_date] ||= Date.today.beginning_of_month.strftime("%m-%d-%Y")
    @end_date = params[:end_date] ||= (Date.today.beginning_of_month + 1.month).strftime("%m-%d-%Y")
    @start_date = Date.strptime @start_date, '%m-%d-%Y' 
    @end_date = Date.strptime @end_date, '%m-%d-%Y'
  end

  # def locationquery
  #   if params[:mhwowcity_id] != "" && params[:mhwowcity_id]
  #     locationquery = " AND programs.mhwowcity_id = " + params[:mhwowcity_id]
  #   else
  #     locationquery = ""
  #   end
  # end
end
