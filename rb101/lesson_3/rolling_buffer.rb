def rolling_buffer1(buffer = ["bye", "Hatzlacha", "see ya"],
  max_buffer_size = 3, new_item = "Salut")
  buffer << new_item
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(buffer = ["Hello", "Howaye", "Shalom"],
  max_buffer_size = 3 , new_item = "hi")
  buffer + [new_item]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

p rolling_buffer1
p rolling_buffer2
