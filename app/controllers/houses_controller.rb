class HousesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize
  layout "mintranet"

  def index
    @regions = House.select(:region).order("region DESC").uniq
    @regions.delete_if {|i| i[:region] == "0" or i[:region] == "" or i[:region] == nil}
    @houses_active = House.where("active = true").order("city, state")
    @houses_inactive = House.where("active = false").order("city, state")
  end

  def show
    @house = House.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end

  def new
    @house = House.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def create
    @house = House.new(params[:house])

    respond_to do |format|
      if @house.save
        format.html { redirect_to action: "index", notice: 'House was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @house = House.find(params[:id])
    if params[:house][:featured] = true
      others = House.where(:featured => true)
      others.each do |o|
        o.featured = false
        o.save!
      end
      @house.featured = true
    end
    
    respond_to do |format|
      if @house.update_attributes(params[:house])
        format.html { redirect_to houses_path, :notice => 'House was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end
end
