module ApplicationHelper
  
  def states_array
      array = [["AK", "Alaska"], ["AL", "Alabama"], ["AR", "Arkansas"], ["AS", "American Samoa"], ["AZ", "Arizona"], ["CA", "California"], ["CO", "Colorado"], ["CT", "Connecticut"], ["DC", "District of Columbia"], ["DE", "Delaware"], ["FL", "Florida"], ["GA", "Georgia"], ["GU", "Guam"], ["HI", "Hawaii"], ["IA", "Iowa"], ["ID", "Idaho"], ["IL", "Illinois"], ["IN", "Indiana"], ["KS", "Kansas"], ["KY", "Kentucky"], ["LA", "Louisiana"], ["MA", "Massachusetts"], ["MD", "Maryland"], ["ME", "Maine"], ["MI", "Michigan"], ["MN", "Minnesota"], ["MO", "Missouri"], ["MS", "Mississippi"], ["MT", "Montana"], ["NC", "North Carolina"], ["ND", "North Dakota"], ["NE", "Nebraska"], ["NH", "New Hampshire"], ["NJ", "New Jersey"], ["NM", "New Mexico"], ["NV", "Nevada"], ["NY", "New York"], ["OH", "Ohio"], ["OK", "Oklahoma"], ["OR", "Oregon"], ["PA", "Pennsylvania"], ["PR", "Puerto Rico"], ["RI", "Rhode Island"], ["SC", "South Carolina"], ["SD", "South Dakota"], ["TN", "Tennessee"], ["TX", "Texas"], ["UT", "Utah"], ["VA", "Virginia"], ["VI", "Virgin Islands"], ["VT", "Vermont"], ["WA", "Washington"], ["WI", "Wisconsin"], ["WV", "West Virginia"], ["WY", "Wyoming"]]    
      array.map! {|i| i.reverse!}
  end
  
  def country_array
      array = [ "Afghanistan", "Aland Islands", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua And Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and McDonald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran, Islamic Republic of", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao", "Macedonia, The Former Yugoslav Republic Of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Palestinian Territory, Occupied", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Barthelemy", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard and Jan Mayen", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Timor-Leste", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Viet Nam", "Virgin Islands, British", "Virgin Islands, U.S.", "Wallis and Futuna", "Western Sahara", "Yemen", "Zambia", "Zimbabwe" ]
      array.map! {|i| i = [i, i]}
  end
  
  def region_array
    final_array = []
    regions = House.select(:region).order("region DESC").uniq
    regions.delete_if {|i| i[:region] == "0" or i[:region] == "" or i[:region] == nil}
    regions.each do |r|
      final_array << [r[:region], r[:region]]
    end
    final_array
  end

  def current_pay_period
    p = Payperiod.where("locked = false").order("date asc").limit(1)
    p = p[0]
  end

  def role_array
    array = [["Resident", "resident"], ["Admin", "admin"], ["MH:WOW", "mhwow"]]
  end
  
  def month_array
    myarray = []
    (0...24).each do |me|
      myarray << [((Date.today + 1.month) - me.months).beginning_of_month.strftime("%m-%d-%Y")]
    end
    myarray
  end

  def get_attendees(programs)
    total = [] 
      programs.each do |prog|
        total << prog.attended_total if prog.attended_total != nil
      end
    sum = 0
    total.each { |a| sum += a}
    return sum
  end

  def get_first_timers(programs)
    total = []
      @mhwebsiteprograms.each do |prog|
        total << prog.attended_new if prog.attended_new != nil
      end
    sum = 0
    total.each { |a| sum += a}
    return sum
  end

  def staff_member(first, last)
    staff = User.where("first_name = '#{first}' AND last_name = '#{last}'").first
    full_name = "#{first} #{last}"
  end

  def get_house(city_name)
    house = House.where("city = '#{city_name}' AND active = true AND id NOT IN(?)", [11,84]).first
    return house.city
  end

  def sortable(column, title=nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end  

  def press_years
    arr = []
    this_year = Date.today.year
    (2008..this_year).each do |year|
      arr << year
    end
    arr
  end

  def month_name
  end

  def budget_date
    date = []    
    this_year = Date.today.year    
    (2008..this_year).each do |year|
      (1..12).each do |month|
        date << "#{month}" + "-" + "#{year}"
      end      
    end
    date
  end
end
