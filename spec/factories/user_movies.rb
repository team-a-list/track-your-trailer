# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  user = create(:user)
  movie = create(:movie)

  factory :user_movie do
    user_id user.id
    movie_id movie.id
  end
end
