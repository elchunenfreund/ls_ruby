class Cipher
  def self.rotate(str, rotate_by)
    str.chars.map do |char|
      if char.match?(/[a-z]/)
        lower_case_rotate(char, rotate_by)
      elsif char.match?(/[A-Z]/)
        upper_case_rotate(char, rotate_by)
      else
        char
      end
    end.join()
  end

  def self.lower_case_rotate(char, int)
    lowercase = ('a'..'z').to_a
    index = lowercase.index(char)
    rotated_arr = lowercase.rotate(int)
    rotated_arr[index]
  end

  def self.upper_case_rotate(char, int)
    upcase = ('A'..'Z').to_a
    index = upcase.index(char)
    rotated_arr = upcase.rotate(int)
    rotated_arr[index]
  end
end
