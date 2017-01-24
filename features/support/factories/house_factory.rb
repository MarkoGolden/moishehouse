require 'factory_girl'

FactoryGirl.define do |variable|

  factory :savable_house, class: House do |f|
    f.city        "Rockville"
    f.state       "MD"
  end
  
  factory :no_city_house, class: House do |f|
    f.state       "MD"
  end

  factory :no_state_house, class: House do |f|
    f.city        "Rockville"
  end

  factory :addressed_house, class: House do |f|
    f.city         "Rockville"
    f.state        "MD"
    f.region       "US East"
    f.mail_address "First St SE"
    f.mail_city    "Washington"
    f.mail_state   "DC"
    f.mail_zip     "20510"
  end
end