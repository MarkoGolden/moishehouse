require 'factory_girl'

FactoryGirl.define do |variable|

  factory :savable_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.email              "user@example.com"
    f.role               "resident"
    f.password           "dummy1"
    f.sign_in_count      0
  end

  factory :savable_mhwow_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.email              "user@example.com"
    f.role               "mhwow"
    f.password           "dummy1"
    f.sign_in_count      0
  end

  factory :savable_admin_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.email              "user@example.com"
    f.role               "admin"
    f.password           "dummy1"
    f.sign_in_count      0
  end

  factory :funny_case_user, class: User do |f|
    f.first_name         "example"
    f.last_name          "user"
    f.email              "USER@EXAMPLE.com"
    f.role               "resident"
    f.password           "dummy1"
    f.sign_in_count      0
  end
    
  factory :no_set_sign_in_count_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.email              "user@example.com"
    f.role               "resident"
    f.password           "dummy1"
  end
    
  factory :no_email_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.role               "resident"
    f.password           "dummy1"
  end

  factory :bad_email_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.email              "user@@example..com"
    f.role               "resident"
    f.password           "dummy1"
  end

  factory :no_password_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.email              "user@example.com"
    f.role               "resident"
  end
  
  factory :short_password_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.email              "user@example.com"
    f.role               "resident"
    f.password           "dummy"
  end

  factory :no_first_name_user, class: User do |f|
    f.last_name          "User"
    f.email              "user@example.com"
    f.role               "resident"
    f.password           "dummy1"
  end
  
  factory :no_last_name_user, class: User do |f|
    f.first_name         "Example"
    f.email              "user@example.com"
    f.role               "resident"
    f.password           "dummy1"
  end

  factory :no_role_user, class: User do |f|
    f.first_name         "Example"
    f.last_name          "User"
    f.email              "user@example.com"
    f.password           "dummy1"
  end

end
