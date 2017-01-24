require 'factory_girl'

FactoryGirl.define do |variable|
  factory :expired_grant, class: Grant do |f|
    f.name        "Expired Grant"
    f.description "Grant expired yesterday"
    f.amount      100.00
    f.expires     Time.now - (60 * 60 * 24)
  end

  factory :unexpired_grant, class: Grant do |f|
    f.name        "Unexpired Grant"
    f.description "Grant expires tomorrow"
    f.amount      100.00
    f.expires     Time.now + (60 * 60 * 24)
  end

  factory :savable_grant, class: Grant do |f|
    f.name        "Savable Grant"
    f.description "Grant contains all required fields"
    f.amount      100.00
    f.expires     Time.now + (60 * 60 * 24)
  end
  
  factory :no_name_grant, class: Grant do |f|
    f.description "Grant missing name"
    f.amount      100.00
    f.expires     Time.now + (60 * 60 * 24)
  end
  
  factory :no_description_grant, class: Grant do |f|
    f.name        "No Description Grant"
    f.amount      100.00
    f.expires     Time.now + (60 * 60 * 24)
  end

  factory :no_amount_grant, class: Grant do |f|
    f.name        "No Amount Grant"
    f.description "Grant missing amount"
    f.expires     Time.now + (60 * 60 * 24)
  end
 
  factory :no_expires_grant, class: Grant do |f|
    f.name        "No Expires Grant"
    f.description "Grant missing expires"
    f.amount      100.00
  end
  
end
