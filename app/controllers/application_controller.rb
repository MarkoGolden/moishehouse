class ApplicationController < ActionController::Base
  protect_from_forgery  

	helper_method :admin?
	helper_method :san_diego_array
	helper_method :date_range

	include PhotoFunctions

	def san_diego_array
		@san_diego = ["La Jolla", "Carlsbad", "Chula Vista", "Coronado", "Del Mar", "El Cajon", 
                  "Encinitas", "Escondido", "Imperial Beach", "La Mesa", "Lemon Grove", 
                  "National City", "Oceanside", "Poway", "San Diego", "San Marcos", "Santee", 
                  "Solana Beach", "Spring Valley", "Vista"]
  end

  def date_range
  	@start_date = params[:start_date] ||= Date.today.beginning_of_month.strftime("%m-%d-%Y")
    @end_date = params[:end_date] ||= (Date.today.beginning_of_month + 1.month).strftime("%m-%d-%Y")
    @start_date = Date.strptime @start_date, '%m-%d-%Y' 
    @end_date = Date.strptime @end_date, '%m-%d-%Y'
  end

	protected

	def admin?
		false
	end

	def authorize
		unless current_user.role == "admin"
			redirect_to root_path
			false
		end
	end
end
