FactoryGirl.define do
  factory :event do
    name 'Event 1'
    event_type 'Training'
    organizer 'XO Group'
    started_at Time.now.to_date
    ended_at (Time.now + 1.day).to_date
    enrollment_ended_at (Time.now + 1.month)
    capacity -1
    description 'event descriptions'
    status 'draft'
    association :user
    departments { build_list :department, 1 }
    association :owner

    trait(:enrollment_out_of_date) do
      enrollment_ended_at (Time.now - 1.month)
      status 'published'
    end

    trait(:index) do
      started_at '2017-01-01 00:00:00'
      ended_at '2017-01-02 00:00:00'
    end

    trait(:mailer_test) do
      association :user
      departments { build_list :department, 3 }
    end

    trait(:with_3_departments) do
      association :user
      departments { build_list :department, 3 }
    end

    trait(:invalid) do
      status nil
    end

    trait(:published) do
      status 'published'
    end

    trait(:draft) do
      status 'draft'
    end

    trait(:convertable) do
      description 'descriptions #{start_date}'
    end

    trait(:unconvertable) do
      description 'descriptions #{no_method}'
    end

    trait(:not_in_whitelist) do
      description 'descriptions #{id}'
    end

    trait(:invalid_enrollment_date) do
      enrollment_started_at (Time.now + 1.month + 1.day)
    end

    trait(:dev) do
      departments { build_list :department, 1, :dev }
    end

  end
end
