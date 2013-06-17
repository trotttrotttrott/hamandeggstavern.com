FactoryGirl.define do
  factory :patron do
    email      { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    mail_is_subscribed false

    trait :mail_is_subscribed do
      mail_is_subscribed true
    end
  end
end
