def swap(str)
  string = str.split.map do |word|
              arr = word.chars
              first = arr.delete(arr.first)
              last = arr.delete(arr.last)
              arr = [last, arr, first].join
            end
  string.join(' ')
end

# LS solution and more simple
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
