# config/puma.rb
port ENV.fetch('PORT', 8080)
# bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 8080)}"
threads 5, 5
