require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

root = File.expand_path("..", __FILE__)

get "/" do
  @files = Dir.glob(root + "/data/*").map do |path|
    File.basename(path)
  end

  erb :index
end

get "/data/:filename" do
  file_path = root + "/data/" + params[:filename]

  headers["Content_Type"] = "text/plain"
  File.read(file_path)
end
