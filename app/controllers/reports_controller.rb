class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize

  def index
    if params[:payperiod]
      @p = Payperiod.find(params[:payperiod].to_i)
    else
      @p = Payperiod.where("locked = true").order("date desc").limit(1)[0]
    end

    if params[:house]
      @h = House.find(params[:house].to_i)
    else
      @h = House.all
    end

    # @p.receipts.each do |r|
    #   if r.program.direct_service
    #     @direct_service << r.program
    #   end    
    # end
  end
  
  # @direct_service = Receipt.joins(:programs).where("programs.direct_service = true")      
  def export_files(xlsx_name, filename)
    @p = Payperiod.find(params[:payperiod])  
    respond_to do |format|
      format.html      
      format.xlsx { render xlsx: "#{xlsx_name}", disposition: "attachment", filename: "#{filename}-#{@p.date.strftime("%D")}.xlsx" }
    end
  end

  def export_receipts
    export_files("export_receipts", "finalreport")
  end

  def export_individual
    export_files("export_individual", "individual-receipts")    
  end

end
