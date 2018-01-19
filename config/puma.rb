workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port   ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

on_worder_boot do
#https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server
  ActiveRecord::Base.establish_connection
end


