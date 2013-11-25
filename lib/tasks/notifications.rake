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
      TwilioApi.notify(user, days_ahead(args))
    end
  end

  task :all, [:days] => :environment do |t, args|
    Rake::Task["notify:email"].execute(args)
    Rake::Task["notify:text"].execute(args)
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
end

# if Date.today.tuesday?  && args == 0
# if Date.today.wednesday? && args == 2
# if Date.today.thursday? && args == 1
# if Date.today.friday? && args == 0

# RAILS_ENV=production bundle exec rake notify:email[2] --silent >> log/whenever-notifications.log 2>&1
# RAILS_ENV=production bundle exec rake notify:email[1] --silent >> log/whenever-notifications.log 2>&1
# RAILS_ENV=production bundle exec rake notify:email[0] --silent >> log/whenever-notifications.log 2>&1


# RAILS_ENV=production bundle exec rake notify:text[2] --silent >> log/whenever-notifications.log 2>&1
# RAILS_ENV=production bundle exec rake notify:text[1] --silent >> log/whenever-notifications.log 2>&1
# RAILS_ENV=production bundle exec rake notify:text[0] --silent >> log/whenever-notifications.log 2>&1

# RAILS_ENV=production bundle exec rake notify:all[2] --silent >> log/whenever-notifications.log 2>&1
# RAILS_ENV=production bundle exec rake notify:all[1] --silent >> log/whenever-notifications.log 2>&1
# RAILS_ENV=production bundle exec rake notify:all[0] --silent >> log/whenever-notifications.log 2>&1

# RAILS_ENV=production bundle exec rake populate:theater --silent >> log/whenever-notifications.log 2>&1
# RAILS_ENV=production bundle exec rake populate:dvd --silent >> log/whenever-notifications.log 2>&1
# RAILS_ENV=production bundle exec rake update:movies --silent >> log/whenever-notifications.log 2>&1
