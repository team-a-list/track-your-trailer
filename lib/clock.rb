require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

require 'rake'
load "#{Rails.root}/lib/tasks/notifications.rake"

# rake = Rake::Application.new
# Rake.application = rake
# Rake::Task.define_task = (:environment)
# args = Rake::TaskArguments.new({:days => 1, [:days] => 1})


every(1.week, 'Running DVD release day notifier', :at => 'Tuesday 18:00', :tz => 'UTC') { Rake::Task["notify:email"].execute(0) }
every(1.week, 'Running the 2 day theater release reminder', :at => 'Wednesday 16:00', :tz => 'UTC') { Rake::Task["notify:email"].execute(2) }
every(1.week, 'Running the tomorrow theater release reminder', :at => 'Thursday 16:00', :tz => 'UTC') { Rake::Task["notify:email"].execute(1) }
every(1.week, 'Running the today theater release reminder', :at => 'Friday 16:00', :tz => 'UTC') { Rake::Task["notify:email"].execute(0) }

every(1.day, 'Populate upcoming theater release movies from Rotten Tomatoes', :at => '8:00', :tz => 'UTC') { Rake::Task["populate:theater"].execute }
every(1.day, 'Populate upcoming dvd release movies from Rotten Tomatoes', :at => '8:00', :tz => 'UTC') { Rake::Task["populate:dvd"].execute }

every(1.day, 'Update existing movies from Rotten Tomatoes for both dvd and release', :at => '8:00', :tz => 'UTC') { Rake::Task["update:movies"].execute }
