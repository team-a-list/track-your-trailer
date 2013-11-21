# Read about factories at https://github.com/thoughtbot/factory_girl
# require 'faker'

FactoryGirl.define do
  factory :movie do
    name "Chicago"
    rotten_tomatoes_uri "1234567"
    release_date_theater "2013-11-18 16:25:30"
    release_date_dvd "2013-11-18 16:25:30"
    poster_image "chicago.jpg"
  end
end
