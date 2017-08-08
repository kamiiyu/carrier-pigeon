FactoryGirl.define do
  factory :department do
    is_active true
    sequence :name do |n|
      "Department#{n}"
    end

    trait :admin do
      name 'Admin'
    end

    trait :dev do
      name 'Dev'
    end

    trait :qa do
      name 'QA'
    end

    trait :pmo do
      name 'PMO'
    end
  end
 end
