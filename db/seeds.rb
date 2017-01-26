# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Purpose.destroy_all
puts "Purposes reset, populating..."
Purpose.create!(:name => "Accomodation and Food", :id => 50)
Purpose.create!(:name => "Accounting & Audit", :id => 45)
Purpose.create!(:name => "Books, Subscriptions & Reference", :id => 15)
Purpose.create!(:name => "Chagim Grants", :id => 10)
Purpose.create!(:name => "Contract Services", :id => 43)
Purpose.create!(:name => "EPF Budget", :id => 2)
Purpose.create!(:name => "European National Conference", :id => 12)
Purpose.create!(:name => "Food and Accomodations", :id => 42)
Purpose.create!(:name => "FSU National Conference", :id => 11)
Purpose.create!(:name => "House Budget", :id => 1)
Purpose.create!(:name => "House Cleaning", :id => 6)
Purpose.create!(:name => "Insurance", :id => 48)
Purpose.create!(:name => "Israeli Culture Grants", :id => 39)
Purpose.create!(:name => "Jewish Salons", :id => 44)
Purpose.create!(:name => "Learning Retreat", :id => 8)
Purpose.create!(:name => "Legal", :id => 47)
Purpose.create!(:name => "Membership, Subscriptions, Equipment Rental", :id => 46)
Purpose.create!(:name => "National Conference", :id => 4)
Purpose.create!(:name => "Office Rent, Parking & Utilities", :id => 49)
Purpose.create!(:name => "Other", :id => 22)
Purpose.create!(:name => "Postage and Delivery", :id => 23)
Purpose.create!(:name => "Repair the World Grants", :id => 9)
Purpose.create!(:name => "Scholarship", :id => 5)
Purpose.create!(:name => "Special Budget", :id => 3)
Purpose.create!(:name => "Supplies & Equipment", :id => 20)
Purpose.create!(:name => "Supplies & Judaica", :id => 41)
Purpose.create!(:name => "Telecommunications & Tech Support", :id => 35)
Purpose.create!(:name => "Transportation for Training Convenings", :id => 40)
Purpose.create!(:name => "Travel - Admin", :id => 37)
Purpose.create!(:name => "Travel - Program", :id => 38)
Purpose.create!(:name => "Birthright NEXT Shabbat", :id => 7)
puts "done"

ProgramType.destroy_all
puts "ProgramType reset, populating..."
# ProgramType.create!(:id => 0, :name => "Default")
ProgramType.create!(:id => 1, :name => "Jewish Culture and Holidays")
ProgramType.create!(:id => 2, :name => "Jewish Learning")
ProgramType.create!(:id => 3, :name => "Repair the World")
ProgramType.create!(:id => 4, :name => "Social")
# find out if we want these two below
# ProgramType.create!(:id => 5, :name => "East Coast Conference")
# ProgramType.create!(:id => 6, :name => "West Coast Conference")
ProgramType.create!(:id => 7, :name => "National Conference")
ProgramType.create!(:id => 8, :name => "Scholarship")
# added birthright next program type -- ask kevin if necessary/why it was omitted
# ProgramType.create!(:id => 9, :name => "Birthright NEXT Shabbat")
ProgramType.create!(:id => 10, :name => "Learning Retreat")
ProgramType.create!(:id => 11, :name => "Us Time")
ProgramType.create!(:id => 12, :name => "Jewish Community")
puts "done"

Granttype.destroy_all
puts "GrantType reset, populating..."
Granttype.create!(:id => 1, :name => "Repair Grants")
Granttype.create!(:id => 2, :name => "Chagim Grants")
Granttype.create!(:id => 3, :name => "Israeli Culture Grants")
puts "done"

Mhwowcity.destroy_all
#"Spring Valley", "Vista"
puts "MhwowCity reset, populating..."
Mhwowcity.create!(:id => 1, :location => "San Diego")
Mhwowcity.create!(:id => 2, :location => "Encinitas")
Mhwowcity.create!(:id => 3, :location => "La Jolla")
Mhwowcity.create!(:id => 4, :location => "Carlsbad")
Mhwowcity.create!(:id => 5, :location => "Chula Vista")
Mhwowcity.create!(:id => 6, :location => "Coronado")
Mhwowcity.create!(:id => 7, :location => "Del Mar")
Mhwowcity.create!(:id => 8, :location => "El Cajon")
Mhwowcity.create!(:id => 9, :location => "Escondido")
Mhwowcity.create!(:id => 10, :location => "Imperial Beach")
Mhwowcity.create!(:id => 11, :location => "La Mesa")
Mhwowcity.create!(:id => 12, :location => "Lemon Grove")
Mhwowcity.create!(:id => 13, :location => "National City")
Mhwowcity.create!(:id => 14, :location => "Oceanside")
Mhwowcity.create!(:id => 15, :location => "Poway")
Mhwowcity.create!(:id => 16, :location => "San Marcos")
Mhwowcity.create!(:id => 17, :location => "Santee")
Mhwowcity.create!(:id => 18, :location => "Solana Beach")
Mhwowcity.create!(:id => 19, :location => "Spring Valley")
Mhwowcity.create!(:id => 20, :location => "Vista")
puts "done"

user = User.new
user.email = 'roey@moishehouse.org'
user.password = 'password'
user.first_name = 'roey'
user.last_name = 'test'
user.role = 'manager'
user.save!