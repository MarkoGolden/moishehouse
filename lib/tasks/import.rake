namespace :import do 

  task :all => :environment do
    Rake::Task['import:users'].execute
    Rake::Task['import:houses'].execute
    Rake::Task['import:receipts'].execute
    Rake::Task['import:grants'].execute
    Rake::Task['import:programs'].execute
    Rake::Task['import:rents'].execute
    Rake::Task['import:payperiods'].execute
  end

  task :press => :environment do
    puts "Deleting All Press..."
    Press.destroy_all
    puts "Done, opening DB connection..."
    query = "SELECT PressID, Title, Publication, FirstPara, URL, Date FROM Press"
    data = ActiveRecord::External.connection.select_rows(query)
    puts "Done"
    puts "Total Press to Import: " + data.length.to_s
    i = 0
    notsaved = []
    data.each do |d|
      n = Press.new
      n.id = d[0]
      n.title = d[1]
      n.publication = d[2]
      n.firstpara = d[3]
      n.url = d[4]
      n.date = d[5]
      if n.save
        me = "great"
      else
        notsaved << n
      end
      i += 1
      puts (i.to_s + " / " + total)
    end
  end

  task :users => :environment do
    puts "Deleting All Users..."
    User.destroy_all
    puts "Done, opening DB connection..."
    query = "select residents.ResidentID, HouseID, First, Last, Email, Phone, RName, Raddress, RCity, 
            RState, RZip, Password, Bio, RSJ, Active, Rank, UserType, Board, userdetails.Alumni from residents
            LEFT JOIN userdetails
            ON residents.ResidentID=userdetails.residentid;"

    data = ActiveRecord::External.connection.select_rows(query)
    puts "Done"
    puts "Total Users to Import: " + data.length.to_s
    data.each do |d|
        n = User.new
        n.id = d[0]
        n.house_id = d[1]
        if d[1] == 11
          n.staff = true
        end
        n.first_name = d[2]
        n.last_name = d[3]
        n.email = d[4]
        n.phone = d[5]
        n.mail_check_name = d[6]
        n.mail_address = d[7]
        n.mail_city = d[8]
        n.mail_state = d[9]
        n.mail_zip = d[10]
        if d[11].length < 6
          n.password = "password"
        else
          n.password = d[11] 
        end 
        n.bio = d[12]
        n.rsj = d[13]
        n.active = d[14]
        if d[16] == "mhwow"
          n.active = true
        end
        n.rank = d[15]
        if d[16] == "mhwow"
          n.mhwow = true
        end
        n.board = d[17]
        n.alumni = d[18]
        #set role for permissions
        if d[16] == "mhwow"
          n.role = "mhwow"
        elsif d[1].to_s == "11"
          n.role = "admin"
        else
          n.role = "resident"
        end
        if n.save
          me = "great"
        else
          puts "Not saved: " + d.inspect
        end
    end

    #board----------------------------------------------------
    # query = "select StaffID, HouseID, First, Last, Email, Phone, SName, Saddress, SCity, SState, SZip, Password, Bio, Active, Rank, Board from staff where board = true;"
    # data = ActiveRecord::External.connection.select_rows(query)
    # puts "Total Users to Import: " + data.length.to_s
    # notsaved = 0
    # data.each do |d|
    #    n = User.new
    #    n.house_id = d[1]
    #    n.first_name = d[2]
    #    n.last_name = d[3]
    #    if d[4] == "" or d[4] == nil
    #      n.email = n.first_name + n.last_name + "_noemail@moishehouse.org"
    #    else
    #      n.email = d[4]
    #    end
    #    n.phone = d[5]
    #    n.mail_check_name = d[6]
    #    n.mail_address = d[7]
    #    n.mail_city = d[8]
    #    n.mail_state = d[9]
    #    n.mail_zip = d[10]
    #    if d[11].length < 6
    #      n.password = "password"
    #    else
    #      n.password = d[11] 
    #    end 
    #    n.bio = d[12]
    #    n.active = d[13]
    #    n.rank = d[14]
    #    n.board = d[15]
    #    if n.save
    #      me = "great"
    #    else
    #      puts "Not saved: " + d.inspect
    #      notsaved += 1
    #    end
    # end
    # u = data.length.to_s
    # puts "Total Internal Users: " + u
    # puts "Skipped Board: " + notsaved.to_s
  end

  task :houses => :environment do
    puts "Deleting all Houses..."
    House.destroy_all
    puts "Done"
    query = "select HouseID, City, State, International, Region, Description, ContactPhone, ContactEmail, MailingName, MailingAddress, "
    query += "RentName, RentAddress, RentCity, RentState, RentZip, RentInfo, NameOnCheck, HouseType, DirectorID, TotalRent, "
    query += "Subsidy, ProgramBudget, SavingsBudget, CalendarURL, Active, RSJ, BRN, startdate, mailingcity, mailingstate, mailingzip, mailinginfo, brnbudget, combinechecks from houses;"
    data = ActiveRecord::External.connection.select_rows(query)
    puts "Total Houses to Import: " + data.length.to_s
    data.each do |d|
      n = House.new
      n.id = d[0]
      n.city = d[1]
      n.state = d[2]
      n.international = d[3]
      n.region = d[4]
      n.web_description = d[5]
      n.contact_phone = d[6]
      n.contact_email = d[7]
      n.mail_name = d[8]
      n.mail_address = d[9]
      n.rent_name = d[10]
      n.rent_address = d[11]
      n.rent_city = d[12]
      n.rent_state = d[13]
      n.rent_zip = d[14]
      n.rent_instructions = d[15]
      n.rent_name_on_check = d[16]
      n.programs_per_month = d[17]
      n.director_id = d[18]
      n.rent_total = d[19]
      n.rent_subsidy = d[20]
      n.budget_program = d[21]
      n.budget_savings = d[22]
      n.calendar_url = d[23]
      n.active = d[24]
      n.rsj = d[25]
      n.brn = d[26]
      n.opened_date = d[27]
      n.mail_city = d[28]
      n.mail_state = d[29]
      n.mail_zip = d[30]
      n.mail_instructions = d[31]
      n.brn_budget = d[32]
      n.combinechecks = d[33]
      if n.save
        me = "great"
      else
        puts "Not Saved: " + d.inspect
      end
    end
    u = House.all
    puts "Total Internal Houses: " + u.length.to_s
  end

  task :receipts => :environment do
    puts "Deleting all Receipts..."
    Receipt.destroy_all
    puts "Done"
    puts "Opening DB connection..."
    query = "select receiptid, houseid, eventid, purchaserid, submitterid, amount, description, "
    query += "perishable, purpose, eventtype, approved, approverID, approveDate, rejectedmsg, payperiodid, "
    query += "closed, grantid, retreat, staff, conference, class, submitted from receipts"
    data = ActiveRecord::External.connection.select_rows(query)
    puts "Done"
    total = data.length.to_s
    puts "Total Receipts to Import: " + total
    i = 0
    notsaved = []
    data.each do |d|
      n = Receipt.new
      n.id = d[0]
      n.house_id = d[1]
      n.program_id = d[2]
      n.purchaser_id = d[3]
      n.submitter_id = d[4]
      n.amount = d[5]
      n.description = d[6]
      n.perishable = d[7]
      n.purpose_id = d[8]
      n.status = d[10]
      n.approver_id = d[11]
      n.approved_date = d[12]
      n.reject_reason = d[13]
      n.payperiod_id = d[14]
      n.closed = d[15]
      n.grant_id = d[16]
      n.retreat = d[17]
      n.staff = d[18]
      n.conference = d[19]
      n.kevin = d[20]
      n.submit_date = d[21]
      if n.save
        me = "great"
      else
        notsaved << n
      end
      i += 1
      puts (i.to_s + " / " + total)
    end
    puts "Before: " + total.to_s
    all_internal = Receipt.all.length
    puts "Total Internal Receipts: " + all_internal.to_s
    puts "Skipped:" + notsaved.length.to_s
    notsaved.each do |n|
      puts n.inspect
    end
  end

  task :grants => :environment do
    puts "Deleting all Grants..."
    Grant.destroy_all
    puts "Done"
    puts "Opening DB connection..."
    query = "select grantid, name, amount, description, datecreated from grants"
    data = ActiveRecord::External.connection.select_rows(query)
    puts "Done"
    total = data.length.to_s
    puts "Total Grants to Import: " + total
    notsaved = []
    data.each do |d|
      n = Grant.new
      n.id = d[0]
      n.name = d[1]
      n.amount = d[2]
      n.description = d[3]
      n.created_at = d[4]
      n.expires = n.created_at + 2.months
      if n.save
        me = "great"
      else
        notsaved << n
      end
    end
    all_internal = Grant.all.length
    puts "Total Internal: " + all_internal.to_s
  end

  task :programs => :environment do
    puts "Deleting all Programs..."
    Program.destroy_all
    puts "Done"
    puts "Opening DB connection..."
    query = "select eventid, houseid, eventname, eventdescription, eventtype, date, datesubmitted, attended, attendedr, "
    query += "firsttimers, datecompleted, photoupdated, adminnotes, partner, submitterid, directservice,mhwow, class, eventstatus, programcity from events;"
    data = ActiveRecord::External.connection.select_rows(query)
    puts "Done"
    total = data.length.to_s
    puts "Total Programs to Import: " + total
    notsaved = []
    i = 0
    data.each do |d|
      n = Program.new
      n.id = d[0]
      n.house_id = d[1]
      n.name = d[2]
      n.description = d[3]
      n.program_type_id = d[4]
      n.date = d[5]
      n.submitted_date = d[6]
      n.attended_total = d[7]
      n.attended_residents = d[8]
      n.attended_new = d[9]
      n.completed_date = d[10]
      n.photo_updated_date = d[11]
      n.admin_notes = d[12]
      n.partner = d[13]
      n.submitter_id = d[14]
      n.direct_service = d[15]
      n.mhwow = d[16]
      n.kevin = d[17]
      n.status = d[18]
      n.program_city = d[19]
      if n.save
        me = "great"
      else
        puts n.inspect
        notsaved << n
      end
      i += 1
      puts i.to_s + " / " + total
    end
    all_internal = Program.all.length
    puts "Total Internal: " + all_internal.to_s
    puts "Total Skipped: " + notsaved.length.to_s
  end

  task :assets => :environment do
    require 'net/ftp'

    puts "Deleting all Assets"
    Asset.destroy_all

    Net::FTP.open('75.103.111.68','MoisheHouse','M01sh3House!') do |ftp|
      ftp.passive = false
      dir = "/data/photos/events/"
      ftp.chdir(dir)
      dir_arr = ftp.nlst
      begin
        dir_arr.each do |pdir|
          new_dir = "/data/photos/events/#{pdir}"
          ftp.chdir(new_dir)
          file_arr = ftp.nlst
          
          puts "In directory: #{pdir}"
          file_arr.each do |item|
            file_arr.delete_if {|i| i == "_notes" }
            puts "Does DIRECTORY = #{pdir} and FILE = #{item} exist?"
            tmp = '/Users/bretkittle/Documents/photodump2/photos/test/' << pdir
            tmp_path = File.join(tmp,item)

            unless File.directory?(tmp)
              FileUtils.mkdir_p(tmp)
            end

            puts "create local file: #{tmp_path}"
            #remote_file = new_dir << "/" << item
            remote_file = "#{new_dir}/#{item}"
            puts "remote file: #{remote_file}"
            ftp.getbinaryfile(remote_file,tmp_path)
            a = Asset.new
            a.program_id = pdir.to_i
            file = File.open(tmp_path)
            a.photo = file
            a.save!
            puts "Saved as Asset => #{a}"
            File.delete(tmp_path)
          end

        end
      rescue Exception => e
        puts "Failed because #{e}"
      end
    end

  end

  task :rents => :environment do
    puts "Deleting all Rents..."
    Rent.destroy_all
    puts "Done"
    puts "Opening DB connection..."
    query = "select paymentid, payperiodid, houseid, amount, adjustments, notes from rent;"
    data = ActiveRecord::External.connection.select_rows(query)
    puts "Done"
    total = data.length.to_s
    puts "Total Rent Records to Import: " + total
    notsaved = []
    i = 0
    data.each do |d|
      n = Rent.new
      n.id = d[0]
      n.payperiod_id = d[1]
      n.house_id = d[2]
      n.amount = d[3]
      n.adjustment = d[4]
      n.notes = d[5]
      if n.save
        me = "great"
      else
        puts n.inspect
        notsaved << n
      end
      i += 1
      puts i.to_s + " / " + total
    end
    all_internal = Rent.all.length
    puts "Total Internal Records: " + all_internal.to_s
    puts "Total Skipped: " + notsaved.length.to_s
  end

  task :payperiods => :environment do
    puts "Deleting all PayPeriods..."
    Payperiod.destroy_all
    puts "Done"
    puts "Opening DB connection..."
    query = "select payperiodid, payperioddate, locked, lockedrent from payperiods;"
    data = ActiveRecord::External.connection.select_rows(query)
    puts "Done"
    total = data.length.to_s
    puts "Total Records to Import: " + total
    notsaved = []
    i = 0
    data.each do |d|
      n = Payperiod.new
      n.id = d[0]
      n.date = d[1]
      n.date = n.date.change(:day => 10) if n.date > '2013-04-01'
      n.locked = d[2]
      n.locked_rent = d[3]
      if n.save(:validate => false)
        me = "great"
      else
        puts n.inspect
        notsaved << n
      end
      i += 1
      puts i.to_s + " / " + total
    end
    all_internal = Payperiod.all.length
    puts "Total Internal Records: " + all_internal.to_s
    puts "Total Skipped: " + notsaved.length.to_s
  end

  # task :photos => :environment do
  #   puts "Deleting all Photos..."
  #   Asset.destroy_all
  #   puts "Done"
  #   puts "Opening DB connection..."
  #   query = "select photoupdated, eventid from events;"
  #   data = ActiveRecord::External.connection.select_rows(query)
  #   puts "Done"
  #   total = data.length.to_s
  #   puts "Total Records to Import: " + total
  #   notsaved = []
  #   i = 0
  #   data.each do |d|      
  #     n = Asset.new  
  #     n.photo_file_name    
  #     n.program_id = d[1]
  #     if n.save(:validate => false)
  #       me = "great"
  #     else
  #       puts n.inspect
  #       notsaved << n
  #     end
  #     i+=1
  #     puts i.to_s + " / " + total
  #   end
  #   all_internal = Asset.all.length
  #   puts "Total Internal Records: " + all_internal.to_s
  #   puts "Total Skipped: " + notsaved.length.to_s
  # end  

  # desc "import all images from SOURCE_DIR folder"
  # task :images => :environment do
  #   # get all images from given folder
  #   Dir.glob(File.join(ENV["SOURCE_DIR"], "*")) do |file_path|
  #     # create new model for every picture found and save it to db
  #     open(file_path) do |f|
  #       pict = Asset.new(:name => File.basename(file_path),
  #                          :photo => f)
  #       # a side affect of saving is that paperclip transformation will
  #       # happen
  #       pict.save!
  #     end


  #     # Move processed image somewhere else or just remove it. It is
  #     # necessary as there is a risk of "double import"
  #     #FileUtils.mv(file_path, "....")
  #     #FileUtils.rm(file_path)
  #   end
  # end

end
