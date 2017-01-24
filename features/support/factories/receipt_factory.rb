require 'factory_girl'

FactoryGirl.define do |variable|
  factory :valid_receipt, class: Receipt do |f|
    f.status        "1"
    f.program_id    47   # Temp placeholder - need to create associated program
    f.amount        49.99
    f.submitter_id  942
    f.purchaser_id  942
    f.purpose_id    1
  end

  factory :no_amount_receipt, class: Receipt do |f|
    f.status        "1"
    f.program_id    47   # Temp placeholder - need to create associated program
    f.submitter_id  942
    f.purchaser_id  942
  end

  factory :negative_amount_receipt, class: Receipt do |f|
    f.status        "1"
    f.program_id    47   # Temp placeholder - need to create associated program
    f.amount        -49.99
    f.submitter_id  942
    f.purchaser_id  942
  end

  factory :no_status_receipt, class: Receipt do |f|
    f.program_id    47   # Temp placeholder - need to create associated program
    f.amount        49.99
    f.submitter_id  942
    f.purchaser_id  942
  end

  factory :no_program_receipt, class: Receipt do |f|
    f.status        "1"
    f.amount        49.99
    f.submitter_id  942
    f.purchaser_id  942
  end

  factory :no_submitter_receipt, class: Receipt do |f|
    f.status        "1"
    f.program_id    47   # Temp placeholder - need to create associated program
    f.amount        49.99
    f.purchaser_id  942
  end

  factory :no_purchaser_receipt, class: Receipt do |f|
    f.status        "1"
    f.program_id    47   # Temp placeholder - need to create associated program
    f.amount        49.99
    f.submitter_id  942
  end

  factory :no_purpose_receipt, class: Receipt do |f|
    f.status        "1"
    f.program_id    47   # Temp placeholder - need to create associated program
    f.amount        49.99
    f.submitter_id  942
    f.purchaser_id  942
  end

end