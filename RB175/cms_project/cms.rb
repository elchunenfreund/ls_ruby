require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"
require "redcarpet"

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

# Generate the data path while acounting for the testing enviorment.
def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

# Render markdown.
def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

# Load the file in the correct format
def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

# Home page, list of files.
get "/" do
  # redirect "/users/signin" unless session[:varified] == "true"

  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end

  erb :index
end

# Route to new file form
get "/new" do
  erb :new
end

# Create a new file
post "/create" do
  filename = params[:filename].to_s

  if filename.size == 0
    session[:message] = "A name is required."
    status 422
    erb :new
  elsif !filename.end_with?('.txt', '.md')
    session[:message] = "File must have a .txt or .md extension."
    status 422
    erb :new
  else
    file_path = File.join(data_path, filename)
    File.write(file_path, "")
    session[:message] = "#{params[:filename]} has been created."
    redirect "/"
  end
end

# view file, and throw error if file doesnt exist
get "/:filename" do
  file_path = File.join(data_path, params[:filename])

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# Edit file
get "/:filename/edit" do
  file_path = File.join(data_path, params[:filename])

  @filename = params[:filename]
  @content = File.read(file_path)
  erb :edit
end

# Edit file content
post "/:filename" do
  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

# Delete File
post "/:filename/delete" do
  file_path = File.join(data_path, params[:filename])

  File.delete(file_path)
  session[:message] = "#{params[:filename]} has been deleted."
  redirect "/"
end

# Sigh in form
get "/users/signin" do
  erb :signin
end

# Sign in proccess
post "/users/signin" do
  session[:username] = params[:username]

  if params[:username] == "admin" && params[:password] == "secret"
    session[:varified] = "true"
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid credentials"
    status 422
    erb :signin
  end
end

# Sign out
post "/users/signout" do
  session.delete(:varified)
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end
