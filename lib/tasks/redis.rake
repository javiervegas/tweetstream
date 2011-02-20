 
task :redis do
# redis-server (opens port 6379)
  exec 'redis-server'
end

task :resque  do
# resque-web (opens port 5678)
  exec 'resque-web'
end

task :flamingod do
  exec 'flamingod','conf/flamingo.yml'
end
