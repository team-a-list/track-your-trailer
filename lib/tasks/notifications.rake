namespace :notification do
  desc "This handles the notifications"
  task :today => :environment do
    users_to_notify = User.users_for
    users_to_notify.each do |user|
      UserMailer.notify(user).deliver!
    end
  end

   task :two_days => :environment do
    # Seriously, nothing
  end

   task :three_days => :environment do
    # Seriously, nothing
  end
end