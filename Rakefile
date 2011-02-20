# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'rubygems'
require 'resque/tasks'
require 'redis'
require 'json'

Tweetstream::Application.load_tasks

task :server do
  exec 'rails', 'server'
end
