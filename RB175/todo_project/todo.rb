require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubi"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# View list of lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# View a single todo list
get "/lists/:index" do
  @list_id = params[:index].to_i
  @list = session[:lists][@list_id]
  erb :list, layout: :layout
end

# Update a single todo list
get '/lists/:index/edit' do
  @list  = session[:lists][params[:index].to_i]
  erb :edit_list, layout: :layout
end

# Return an error message if hte name is invalid. return nil if name valid
def error_for_list_name(name)
  if !(1..100).cover? name.size
    "List name must between 1 and 100 characters."
  elsif session[:lists].any? { |list| list[:name] == name }
    "List name must be unique."
  else
    nil
  end
end

def error_for_todo(name)
  if !(1..100).cover? name.size
    "Todo must between 1 and 100 characters."
  else
    nil
  end
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

# Change list name
post "/lists/:index" do
  list_name = params[:list_name].strip
  index = params[:index].to_i
  @list  = session[:lists][index]

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name

    session[:success] = "The list has been updated."
    redirect "/lists/#{index}"
  end
end

# Delete a todo list
post '/lists/:index/delete' do
  index = params[:index].to_i
  session[:lists].delete_at(index)
  session[:success] = "The list has been deleted"
  redirect "/lists"
end

# Add a new todo to a list
post '/lists/:list_id/todos' do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]
  text = params[:todo].strip

  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << { name: text, completed: false }
    session[:success] = "The todo was added"
    redirect "/lists/#{@list_id}"
  end
end

# Delete a todo
post '/list/:list_id/todos/:todo_id/destroy' do
  @list_id = params[:list_id].to_i
  todo_id = params[:todo_id].to_i
  @list = session[:lists][@list_id]
  @list[:todos].delete_at(todo_id)
  redirect "/lists/#{@list_id}"
end
