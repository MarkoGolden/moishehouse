class GrantsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize
  layout "mintranet"

  def index
    @grants = Grant.order("created_at DESC")
  end

  def new
    @grant = Grant.new
  end

  def create
    @grant = Grant.new(params[:grant])
    @grant.save!
    redirect_to grants_index_path
  end

  def edit
    @grant = Grant.find(params[:id])
  end

  def update
    @grant = Grant.find(params[:grant][:id])
    @grant.update_attributes!(params[:grant])
    redirect_to grants_index_path
  end

  def destroy
    @grant = Grant.find(params[:id])
    @grant.destroy
    redirect_to grants_index_path
  end

  def programs
    @start_date = params[:start_date] ||= Date.today.beginning_of_month.strftime("%m-%d-%Y")
    @end_date = params[:end_date] ||= (Date.today.beginning_of_month + 1.month).strftime("%m-%d-%Y")
    @start_date = Date.strptime @start_date, '%m-%d-%Y' 
    @end_date = Date.strptime @end_date, '%m-%d-%Y'
    @programs = Program.joins(:receipts).where("receipts.grant_id IS NOT NULL").order("date DESC").uniq
  end

end
