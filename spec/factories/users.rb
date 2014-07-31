# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Greg Eng"
    email "greg.eng@gmail.com"
    phone_number "15555555555"
    password "password"
    password_confirmation "password"

   factory :confirmed_user do
    confirmed_at { "2014-07-31 05:59:19.049549" }
    confirmation_sent_at { "2014-07-31 05:59:13.789266" }
    end
  end

end
