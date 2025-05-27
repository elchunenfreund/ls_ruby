require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

get "/" do # basic routing method that creates a files variable that will be used in the list erb file.
  @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort # sorts the files
  @files.reverse! if params[:sort] == "desc" # reverses the if the params variable is assigned to do so.
  erb :list
end
