# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_integration, :class => 'Admin::Integration' do
    admin_id 1
    token "MyString"
    type ""
  end
end
