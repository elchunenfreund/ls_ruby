require "tilt/erubi"
require "sinatra"
require "sinatra/reloader" if development?

configure :production do
  # Whitelist Fly.io’s host header so Rack::Protection doesn’t reject it.
  use Rack::Protection::HostHeader,
      allow: ['book-viewer-holy-frost-5259.fly.dev']
end

before do
  @contents = File.readlines("data/toc.txt") # this loads the file containig all chapter names, not sure how that is used.
end

get "/" do # routing to the home erb file.
  @title = "The Adventures of Sherlock Holmes" # hardcode the title name.

  erb :home
end

get "/chapters/:number" do # uses a url paarameter to assign a chapter number which is then used to search for it.
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number # redirect to home if out of range, not sure what the cover method is.

  @title = "Chapter #{number}: #{chapter_name}" # assigns a chapter name.
  @chapter = File.read("data/chp#{number}.txt") # aasigens the chapter to be rendered in the chapter erb file

  erb :chapter
end

helpers do
  def in_paragraphs(text) # a helper method to split the paragaphs
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end
end

not_found do
  redirect "/" # redirect to home if not found using a designated sinatra method 
end

# Calls the block for each chapter, passing that chapter's number, name, and
# contents.
def each_chapter # costom each method that yields with seperate parameters for the name, name and actual chapter.
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

# This method returns an Array of Hashes representing chapters that match the
# specified query. Each Hash contain values for its :name and :number keys.
def chapters_matching(query)
  results = []

  return results unless query

   each_chapter do |number, name, contents|
    matches = {}
    contents.split("\n\n").each_with_index do |paragraph, index|
      matches[index] = paragraph if paragraph.include?(query)
    end
    results << {number: number, name: name, paragraphs: matches} if matches.any? # returns the chapters that match im not sure how the matching paragraphs are returned.
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query]) # passes the search results from the params into the search erb file
  erb :search
end

helpers do # helper method that highlights the words that match the search query.
  def highlight(text, term)
    text.gsub(term , %(<strong>#{term}</strong>)) 
  end
end
