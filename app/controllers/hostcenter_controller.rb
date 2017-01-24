class HostcenterController < ApplicationController
  include PhotoFunctions
  layout "mintranet"
	def index
	end	

	def receipts
		if params[:daysago]
      @daysago = params[:daysago].to_i
    else
      @daysago = 30
    end
	end

	def receipts_new		
    @receipt = Receipt.new
	end

	def receipts_create
		@receipt = Receipt.new(params[:receipt])
    @receipt.status = "1"
    @receipt.submit_date = Time.now
    @receipt.save!
    redirect_to host_center_my_programs_path, :notice => "Receipt succesfully uploaded!"
  end

  def receipts_edit
  	@receipt = Receipt.find(params[:id])
    if @receipt.house_id != current_user.house_id
      redirect_to host_center_receipts_path
    end
  end

  def receipts_update
  	@receipt = Receipt.find(params[:receipt][:id])
    @receipt.update_attributes!(params[:receipt])
    redirect_to host_center_my_programs_path, :notice => "Updated!"
  end
	
  def my_programs	
		if params[:daysago]
	    @daysago = params[:daysago].to_i
	  else
	    @daysago = 30
	  end
	end

	def register_program
		@program_types = ProgramType.where("id IN(1,2,3,12)")
	end

	def programs_create
		program = Program.new(params[:program])
    program.house_id = current_user.house_id
    program.submitter_id = current_user.id
    program.status = "Pending"
    program.save!

    redirect_to host_center_my_programs_path, :notice => "Program successfully created!"    
	end

	def programs_edit
		@program_types = ProgramType.where("id IN(1,2,3,12)")
		@program = Program.find(params[:id])
    @submitter = User.find(@program.submitter_id).firstlast
	end

	def programs_update		
		@program = Program.find(params[:program_id])        
  	@program.update_attributes!(params[:program])
 	  redirect_to host_center_programs_edit_path, :notice => "Program successfully updated!"      	
	end

	def programs_destroy
		@program = Program.find(params[:program_id])		
		@program.destroy
    respond_to do |format|
      format.html { redirect_to host_center_my_programs_path }
      format.json { head :no_content }
    end
  end  

	def upload_receipts
	end

	def scholarship_form		
	end

	def guidelines
	end

	def program_ideas
	end

	def help		
	end

	def daysago
	  
	end
end
