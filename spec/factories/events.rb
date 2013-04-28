# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    date "2013-04-20"
    start "2013-04-20 02:40:58"
    finish "2013-04-20 02:40:58"
    words "MyString"
  end
end
