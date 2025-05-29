class TextAnalyzer
  def process
    file = File.open('sample_text.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.to_s.split("\n\n").count} paragraphs"}
analyzer.process { |file| puts "#{file.to_s.split("\n").count} lines"}
analyzer.process { |file| puts "#{file.split(' ').count} words" }


