require "yaml" # libary that allows us to load the YAML file in the correct structure.

require 'sinatra' # framework for the server
require 'sinatra/reloader' # reload the server when a change is made
require 'tilt/erubi' # not sure what this is somethig with templates but not sure.

before do # sintra DSL, before a method is run open the yaml file.
  @users = YAML.load_file("users.yaml") # load the file
end

helpers do
  def count_interests(users) # sinatra DSL, helper that counts interests using reduce with tricky parameters
    users.reduce(0) do |sum, (name, user)|
      sum + user[:interests].size # adds the value of user[:interests].size
    end
  end
end

get "/" do # sinatra DSL, that rerouts home to the users route.
  redirect "/users" # sinatra DSL that does the rerouting
end

get "/users" do # sintara DSL, that loads the users.erb file when routed
  erb :users # points to the erb file which will render.
end

get "/:user_name" do # sinatra DSL, :user_name is a dynamic route parameter that matches any value in that position.
  @user_name = params[:user_name].to_sym # when one a passes in a string in place of the parameter it becomes the params value for :user_name, which is converted to a symbol
  @email = @users[@user_name][:email] # since @users was loaded by the before method it can be used to access the email using the symbol.
  @interests = @users[@user_name][:interests] # same with interets.

  erb :user # points to the erb file which will render.
end
