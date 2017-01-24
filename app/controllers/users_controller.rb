class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize

  layout "mintranet"
  
  def index
    #inefficient, try using one collection and filtering from the ruby side, not DB
    @residents = User.where("active = true and house_id NOT IN (11,84)").order("last_name")
    @alumni = User.where("active = false and house_id NOT IN (11,84)").order("last_name")
    @mhwow = User.where("house_id = 84 and active = true").order("last_name")
    @staff = User.where("role = 'admin' and active = true").order("last_name")
    @board = User.where("board = true and active = true").order("last_name")
    @all = User.where("active = true").order("last_name")
    san_diego_array
    @total_hosts = User.where("house_id = 84").size
    @total_alumni = User.where("house_id = 84 AND alumni = true").size
    @san_diego_hosts = User.where("house_id = 84 and mail_city IN (?)", @san_diego).size
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    @user = User.find_by_email(params[:user][:email])
    @user.update_attributes!(params[:user])
    # sign_in @user, :bypass => true if current_user.id = @user.id
    if current_user.role == "admin"
      redirect_to welcome_index_path, :notice => "User was successfully updated."
    elsif current_user.role == "mhwow"
      redirect_to hostcenter_index_path, :notice => "User was successfully updated."
    else
      redirect_to users_index_path, :notice => "User was successfully updated."
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.mail_address == ""
      @user.mail_address = @user.house.mail_address
      @user.mail_city = @user.house.mail_city
      @user.mail_state = @user.house.mail_state
      @user.mail_zip = @user.house.mail_zip      
    end
    @user.save!
    redirect_to users_index_path, :notice => 'User was successfully created.'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_index_path, :notice => 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end
