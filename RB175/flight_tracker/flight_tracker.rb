require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubi"
require "redcarpet"
require "yaml"
require "bcrypt"

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end


def airlines
  YAML.load_file("airlines.yml")["airlines"]
end

def airports
  YAML.load_file("airports.yml")["airport_codes"]
end

get "/" do
  @airports = airports

  @airlines = airlines

  erb :form
end

post '/flight/details' do
  if params[:origin] == params[:destination]
    session[:message] = 'You dont really want to take a flight that will arive at the same boring place you left from, or do you?'
    redirect "/"
  end

  session[:airline] = params[:airline]
  session[:number] = params[:number]
  session[:origin] = params[:origin]
  session[:destination] = params[:destination]
  hour = "#{"%02d" % params[:hour]}"
  minute = "#{"%02d" % params[:minute]}"
  session[:time] = "#{hour}:#{minute} #{params[:meridiem]}"

  session[:message] = "Your details have been saved."

  erb :details
end
