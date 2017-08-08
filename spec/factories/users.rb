FactoryGirl.define do
  factory :user do
      sequence :email {"#{Faker::Name.first_name}@xogrp.com"}
      password '12345678'
      sequence :first_name {Faker::Name.first_name}
      sequence :last_name {Faker::Name.last_name}
      sequence :chinese_name {Faker::Name.name}
      association :department, :admin
      gender 1

    trait(:vince) do
      email 'vhe@xogrp.com'
      password '12345678'
      first_name 'Vince'
      last_name 'He'
      chinese_name '何文斯'
      association :department, :dev
      gender 1
    end

    trait(:alex) do
      email 'aqiu@xogrp.com'
      password '12345678'
      first_name 'Alex'
      last_name 'Qiu'
      chinese_name '邱国樑'
      association :department, :admin
      gender 1
    end

    trait(:dev) do
      sequence(:email){|n| "dev#{n}@xogrp.com"}
      password '12345678'
      sequence(:first_name){|n| "Dev#{n}"}
      last_name 'D'
      association :department, :dev
      sequence(:chinese_name){|n| "开发#{n}"}
      gender 1
    end

    trait(:qa1) do
      email 'qa1@xogrp.com'
      password '12345678'
      first_name 'qa1'
      last_name 'Q'
      chinese_name '测试1'
      association :department, :qa
      gender 1
    end

    trait(:pmo1) do
      email 'pmo1@xogrp.com'
      password '12345678'
      first_name 'Pmo1'
      last_name 'P'
      chinese_name '项目管理1'
      department_id 3
      gender 1
    end

    factory :owner, class: User do
        sequence :email {"#{Faker::Name.first_name}@xogrp.com"}
        password '12345678'
        sequence :first_name {Faker::Name.first_name}
        sequence :last_name {Faker::Name.last_name}
        sequence :chinese_name {Faker::Name.name}
        association :department, :admin
        gender 1
    end
  end
 end
