# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    name "Chicago"
    release_date_theater "2013-11-18 16:25:30"
    release_date_dvd "2013-11-18 16:25:30"
    poster_image "chicago.jpg"
  end
end
