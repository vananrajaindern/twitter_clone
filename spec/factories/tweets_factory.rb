FactoryGirl.define do
  factory :tweet do

    association :user, factory: :user
    text 'text1'

  end
end
