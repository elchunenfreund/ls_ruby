# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(obj)
    raise TypeError, "Can only add Todo objects" unless obj.is_a?(Todo)

    todos << obj
    todos
  end

  def <<(obj)
    add(obj)
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def item_at(int)
    raise IndexError if int > (todos.size - 1)
    todos[int]
  end

  def mark_done_at(int)
    raise IndexError if int > (todos.size - 1)
    todos[int].done!
  end

  def mark_undone_at(int)
    raise IndexError if int > (todos.size - 1)
    todos[int].undone!
  end

  def done!
    todos.map(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(int)
    raise IndexError if int > (todos.size - 1)
    todos.delete_at(int)
  end

  def to_s
    puts " ---- #{self.title} ---- "
    todos.each do |todo|
      puts todo
    end
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)

list.to_s

