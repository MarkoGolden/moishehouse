class RentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize
  layout "mintranet"

  def index
    @houses = House.where("active = true and id NOT IN (84,11) and rent_subsidy NOT IN (0)").order("city")
  end

  def submit
    #lock payperiod
    p = Payperiod.find(params[:payperiod_id])
    p.locked = true
    p.locked_rent = true
    p.save!

    #create rent objects
    params["houses"].each do |h|
      r = Rent.new
      r.amount = h[1]["amount"]
      r.adjustment = h[1]["adjustment"]
      r.notes = h[1]["notes"]
      r.house_id = h[1]["house_id"]
      r.payperiod_id = p.id
      r.save!
    end

    #associate all approved open receipts
    receipts = Receipt.where("payperiod_id IS NULL and status = '2'")
    receipts.each do |r|
      r.closed = true
      r.payperiod_id = p.id
      r.save!
    end
    redirect_to reports_index_path, :notice => "Closeout for #{p.date.strftime("%d/%m/%y")} successful!"
  end
end