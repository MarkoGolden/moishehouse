require 'factory_girl'

FactoryGirl.define do |variable|
  factory :valid_program_with_name, class: Program do |f|
    f.date            Time.now
    f.description     "Program has name"
    f.name            "My Program Name"
    f.house_id        "11"
    f.program_type_id "1"
  end

  factory :no_date_program, class: Program do |f|
    f.description "Program has no date"
    f.name        "My Dateless Program Name"
    f.house_id    "11"
  end

  factory :no_description_program, class: Program do |f|
    f.date        Time.now
    f.name        "My Program Name"
    f.house_id    "11"
  end

  factory :no_name_program, class: Program do |f|
    f.date        Time.now
    f.description "Program has no name"
    f.house_id    "11"
  end

  factory :no_house_program, class: Program do |f|
    f.date        Time.now
    f.description "Program description"
    f.name        "Program name"    
  end

  factory :no_program_type_program, class: Program do |f|
    f.date        Time.now
    f.description "Program has name"
    f.name        "My Program Name"
    f.house_id    "11"
  end
end