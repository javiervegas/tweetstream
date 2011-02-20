# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'rubygems'
require 'resque/tasks'
require 'redis'
require 'json'

Tweetstream::Application.load_tasks


# flamingo path/to/flamingo.yml
# flamingod -c path/to/flamingo.yml (opens sinatra in 4711 and logs to
# /tmp/flamingo.log)
 
 
# Simple example: reads from a subscription queue, writes the events to STDOUT
# Usage (from this directory):
#   $ QUEUE=EXAMPLES rake resque:work

class HandleFlamingoEvent
  # type: One of "tweet" or "delete"
  # event: a hash of the json data from twitter
  #
  #def self.perform(type, event_info, event)

  @redis = Redis.new
  def self.perform(type, event)
    @redis.set type, event.to_json
    puts event.fetch("text")
  end

end
