namespace :notify do
  def days_ahead(args)
    if args.class == Fixnum
      args
    else
      args.days.to_i
    end
  end

  desc "This handles the notifications"

  task :email, [:days] => :environment do |t, args|
    users_to_notify = User.users_for(days_ahead(args))
    users_to_notify.each do |user|
      UserMailer.notify(user, days_ahead(args)).deliver!
    end
  end

  task :text, [:days] => :environment do |t, args|
    users_to_notify = User.users_for(days_ahead(args))
    users_to_notify.each do |user|
      if user.phone_verified
        TwilioApi.notify(user, days_ahead(args))
      end
    end
  end

  task :all, [:days] => :environment do |t, args|
    Rake::Task["notify:text"].execute(args)
    Rake::Task["notify:email"].execute(args)
  end
end

namespace :populate do
  task :theater => :environment do
    RottenTomatoesApi.seed_upcoming_theater
  end

  task :dvd => :environment do
    RottenTomatoesApi.seed_upcoming_dvds
  end
end

namespace :update do
  task :movies => :environment do
    RottenTomatoesApi.update_existing_movies
  end

  task :movie_poster_images => :environment do
    RottenTomatoesApi.update_movie_default_posters
    RottenTomatoesApi.update_movie_posters
  end

end
