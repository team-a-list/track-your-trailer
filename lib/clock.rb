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
every(1.week, 'Running email notifier', :at => 'Thursday 18:00', :tz => 'UTC') { Rake::Task["notify:email"].execute(1) }