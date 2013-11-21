# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Emily"
    email "emily@xie.com"
    phone_number "555-555-5555"
    password "test"
    password_confirmation "test"
  end
end
