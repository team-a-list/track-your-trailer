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

  task :theater do
    # populate new movies with theater release dates
  end

  task :dvd do
    # populate new movies with theater release dates
  end

end

namespace :update do
  task :movies do
    # update existing movies
  end
end