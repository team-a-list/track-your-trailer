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
      name { "Toy Story 3" }
      rotten_tomatoes_uri { 770672122 }
    end

    factory :nil_release_date_theater_movie do
      release_date_theater { nil }
      name { "Captain America: The First Avenger" }
      rotten_tomatoes_uri { 770739679 }
    end

    factory :nil_release_date_dvd_movie do
      release_date_dvd { nil }
      name { "True Grit" }
      rotten_tomatoes_uri { 770860165 }
    end

    factory :thumbnail_poster_image_movie do
      poster_image { "http://content7.flixster.com/movie/11/17/81/11178109_tmb.jpg" }
    end

    factory :default_poster_image_movie do
      poster_image { "http://d1rjibvava1hwe.cloudfront.net/static/images/redesign/poster_default_thumb.gif" }
    end
  end
end
