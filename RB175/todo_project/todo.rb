require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubi"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

configure do
  set :erb, :escape_html => true
end

before do
  session[:lists] ||= []
end

helpers do
  def list_complete?(list)
    todos_remaining_count(list) == 0 && todos_count(list) > 0
  end

  def list_class(list)
    "complete" if list_complete?(list)
  end

  def todos_count(list)
    list_size = list[:todos].size
  end

  def todos_remaining_count(list)
    todos_competed = list[:todos].count { |todo| !todo[:completed] }
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }

    incomplete_lists.each(&block)
    complete_lists.each(&block)
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }

    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end
end

def next_element_id(elements)
  max = elements.map { |element| element[:id] }.max || 0
  max + 1
end

# Validate list entry
def load_list(id)
  list = session[:lists].find { |list| list[:id] == id }
  return list if list

  session[:error] = "The specified list was not found."
  redirect "/lists"
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
get "/lists/:id" do
  id = params[:id].to_i
  @list = load_list(id)
  @list_id = params[:id].to_i
  @list = load_list(@list_id)
  erb :list, layout: :layout
end

# Edit an existing todo list
get '/lists/:id/edit' do
  @list_id = params[:id].to_i
  @list  = load_list(@list_id)
  erb :edit_list, layout: :layout
end

# Create a new list
post "/lists" do
  @lists = session[:lists]
  list_name = params[:list_name].strip

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    id = next_element_id(@lists)
    session[:lists] << { id: id, name: list_name, todos: [] }
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

# Change list name
post "/lists/:id" do
  @lists = session[:lists]
  list_name = params[:list_name].strip
  @list_id = params[:id].to_i

  @list = @lists.find { |list| list[:id] == @list_id }

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name

    session[:success] = "The list has been updated."
    redirect "/lists/#{@list_id}"
  end
end

# Delete a todo list
post "/lists/:id/destroy" do
  id = params[:id].to_i
  session[:lists].reject! { |list| list[:id] == id }
  session[:success] = "The list has been deleted."
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    redirect "/lists"
  end
end

# Add a new todo to a list
post '/lists/:list_id/todos' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  text = params[:todo].strip

  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    id = next_element_id(@list[:todos])
    @list[:todos] << { id: id, name: text, completed: false }

    session[:success] = "The todo was added"
    redirect "/lists/#{@list_id}"
  end
end

# Delete a todo from a list
post '/lists/:list_id/todos/:id/destroy' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo_id = params[:id].to_i
  @list[:todos].reject! { |todo| todo[:id] == todo_id}

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204
  else
    session[:success] = "The todo has been deleted"
    redirect "/lists/#{@list_id}"
  end
end

# Update the status of a todo
post '/lists/:list_id/todos/:id' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  todo_id = params[:id].to_i
  is_completed = params[:completed] == "true"
  todo = @list[:todos].find { |todo| todo[:id] == todo_id }
  todo[:completed] = is_completed

  session[:success] = "The todo has been updated"
  redirect "/lists/#{@list_id}"
end

# Mark all todos as complete
post '/lists/:list_id/complete_all' do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)

  @list[:todos].each do |todo|
    todo[:completed] = true
  end

  session[:success] = "All todos have been completed"
  redirect "/lists/#{@list_id}"
end
