<<<<<<< HEAD
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! do |hsh|
  hsh.map do |k, v|
    if k.to_s == "published"
      v.to_i
    end
  end
end

p books

# Ls Sulution
books.sort_by do |book|
  book[:published]
end

=======
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! do |hsh|
  hsh.map do |k, v|
    if k.to_s == "published"
      v.to_i
    end
  end
end

p books

# Ls Sulution
books.sort_by do |book|
  book[:published]
end

>>>>>>> 2113b635709d06b307ae87266583bf22ffea20c9
