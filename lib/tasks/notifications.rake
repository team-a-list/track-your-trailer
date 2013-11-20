namespace :notify do
  desc "This handles the notifications"

  task :email, [:days] => :environment do |t, args|
    users_to_notify = User.users_for(args.days.to_i)
    users_to_notify.each do |user|
      UserMailer.notify(user, args.days.to_i).deliver!
    end
  end

  task :text, [:days] => :environment do |t, args|
    users_to_notify = User.users_for(args.days.to_i)
    users_to_notify.each do |user|
      TwilioApi.notify(user, args.days.to_i)
    end
  end

  task :all, [:days] => :environment do |t, args|
    Rake::Task["notify:email"].execute(args)
    Rake::Task["notify:text"].execute(args)
  end

end

