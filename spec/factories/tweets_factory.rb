FactoryGirl.define do
  factory :tweet do

    association :user, factory: :user
    text 'text1'

    trait :invalid do
      text nil
    end

    trait :tagged do
      text 'text1 #tagged'
    end

  end
end
