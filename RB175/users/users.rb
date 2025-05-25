require "tilt/erubi"
require "sinatra"
require "sinatra/reloader"

Psych.load_file("users")

get "/" do
  redirect ""
