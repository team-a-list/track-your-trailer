# Read about factories at https://github.com/thoughtbot/factory_girl
# require 'faker'

FactoryGirl.define do
  factory :movie do
    name "Chicago"
    sequence(:rotten_tomatoes_uri) { |n| "1234#{n}" }
    release_date_theater "2013-11-18 16:25:30"
    release_date_dvd "2013-11-18 16:25:30"
    poster_image "chicago.jpg"

    factory :theater_movie_today do
      release_date_theater { Time.zone.now.beginning_of_day }
    end

    factory :dvd_movie_today do
      release_date_dvd { Time.zone.now.beginning_of_day }
    end

    factory :specific_movie do
      name { "Toy Story" }
      rotten_tomatoes_uri { 770672122 }
    end

    factory :nil_release_date_theater do
      release_date_theater { nil }
    end

    factory :nil_release_date_dvd do
      release_date_dvd { nil }
    end
  end
end
