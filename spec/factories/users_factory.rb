FactoryGirl.define do
  factory :user do

    sequence(:email) { |n| "email#{n}@mail.com" }
    password "123123123"

  end
end
