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

def credentials_path
  path = if ENV["RACK_ENV"] == 'test'
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  path
end

# Load file with users and passwords
def load_user_credentials
  YAML.load_file(credentials_path)
end

# varify creditentials using bcrypt
def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

def user_signed_in?
  session.key?(:username)
end

def require_signed_in_user
  unless user_signed_in?
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

def list_of_files
  pattern = File.join(data_path, "*")
  files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end

  files
end

# Home page, list of files.
get "/" do

  @files = list_of_files

  erb :index
end

# Route to new file form if signed in.
get "/new" do
  require_signed_in_user
  erb :new
end

# Create a new file
post "/create" do
  require_signed_in_user

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
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  @filename = params[:filename]
  @content = File.read(file_path)
  erb :edit
end

# Edit file content
post "/:filename" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

get "/:filename/duplicate" do
  require_signed_in_user

  @filename = params[:filename]

  erb :dupfile
end

# duplicate a file
post "/:filename/duplicate" do
  require_signed_in_user

  old_filename = params[:filename].to_s
  new_filename = params[:newfilename]

  original_path = File.join(data_path, old_filename)
  new_path = File.join(data_path, new_filename)

  content = File.read(original_path)


  if list_of_files.include?(new_filename)
    session[:message] = "You need to choose a unique a name"
    @filename = new_filename
    erb :dupfile
  else
    File.write(new_path, content)
    session[:message] = "a copy of #{params[:filename]} has been created."
    redirect "/"
  end
end

# Delete File
post "/:filename/destroy" do
  require_signed_in_user

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
  credentials = load_user_credentials
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:username] = username
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
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end

# add a new user
get '/users/signup' do
  erb :signup
end

# add username and password to the yaml file
post "/users/signup" do
  username = params[:username].to_s
  password = params[:password1].to_s
  creds = YAML.load_file(credentials_path)

  if username.empty? || password.empty?
    session[:message] = "You need to enter a valid Username and Password"
    erb :signup
  elsif creds.keys.include?(username)
    session[:message] = "Your Username has to be unique."
    @username = username
    erb :signup
  elsif password != params[:password2].to_s
    session[:message] = "Your passwords need to match."
    @username = username
    erb :signup
  else
    creds[username] = BCrypt::Password.create(password).to_s

    File.open(credentials_path, 'w') do |f|
      f.write creds.to_yaml
    end

    session[:message] = "You have successfully registered."
    redirect "/"
  end
end
