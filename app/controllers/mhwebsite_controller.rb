class MhwebsiteController < ApplicationController	
	def index
		@houses = House.where("active = TRUE AND id NOT IN(?)", [11,84])
		@mhwebsiteprograms = Program.where("house_id NOT IN(?) AND program_type_id IN(?) AND Date BETWEEN TO_DATE(?) AND now()", [11,84], [0,1,2,3,4,9], ['1/1/2013', '%m/1/%Y'])

		#this is how we get snapshot on old website. instead of date range ending on current date, it ends at end of current month. find out which is preferred/more accurate.
		# @mhwebsiteprograms = Program.where("house_id NOT IN(11,84) AND program_type_id IN(0,1,2,3,4,9) AND Date BETWEEN STR_TO_DATE('1/1/2013', '%m/1/%Y') AND STR_TO_DATE('11/1/2013', '%m/1/%Y')")
	end

	#about us menu
	def mission #done
	end

	def background #done
	end

	def quarterly #done		
	end

	def our_team		
	end

	def board #done
	end

	def supporters 
	end

	def evaluation #done
	end

	def moishe_monthly #done
	end

	def jobs #done
	end

	def press
		if params[:date]
			year = params[:date]
			@pressers = Press.where("year(date) = ?", year).order('date DESC')
		else
			year = Date.today.year
			@pressers = Press.where("year(date) = ?", year).order('date DESC')
		end
	end

	def faq
	end

	def houselist
		@houses_usa = House.where('active = true AND ID NOT IN(?) AND international = 0', [11,84]).order('city')
		@houses_int = House.where('active = true AND ID NOT IN(?) AND international = 1', [11,84]).order('city')
	end

	def houses
		#@houses = House.where('active = true AND ID NOT IN(?)', [11,84]).order('city')

		@houses_usa = House.where('active = true AND ID NOT IN(?) AND international = 0', [11,84]).order('city')
		@houses_int = House.where('active = true AND ID NOT IN(?) AND international = 1', [11,84]).order('city')

	end

	def house
		@house = House.find_by_slug(params[:id])
		render 'house', :layout => 'house'
	end

	def house_residents
		@house = House.find_by_slug(params[:id])
		render 'house_residents', :layout => 'house_residents'
	end

	def house_photos
		@house = House.find_by_slug(params[:id])
		@programs = @house.programs
		render 'house_photos', :layout => 'house_photos'
	end


	def _house
	end

	def learning
	end

	def apply
	end

	# def mhwow
	# end	

end
