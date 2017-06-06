FactoryGirl.define do
  factory :comment do

    association :user, factory: :user
    association :tweet, factory: :tweet
    text 'text1'

    trait :invalid do
      text nil
    end

  end
end
