def url?(text)
  text.match?(/\Ahttps?:\/\/\S+\z/)
end

def fields(str)
  p str.split(/[ \s,]+/)
end

def mystery_math(str)
  str.gsub(/[+\-*\/]/, '?')
end

def danish(str)
  p str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'

danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

danish('The cherry of my eye')
# -> 'The danish of my eye'

danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

danish('I love pineapple')
# -> 'I love pineapple'
