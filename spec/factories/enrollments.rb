FactoryGirl.define do
  factory :enrollment do
    association :event, :enrollment_out_of_date
    association :user 
  end
end
