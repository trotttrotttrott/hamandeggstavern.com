FactoryGirl.define do
  factory :admin do
    email Faker::Internet.email
    password 'hamandturd'
  end
end
