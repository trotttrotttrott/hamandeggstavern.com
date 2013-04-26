# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    date "2013-04-20"
    from "2013-04-20 02:40:58"
    to "2013-04-20 02:40:58"
    details "MyString"
  end
end
