

def uuid_creator
  parts = [8,4,4,4,12]
  uuid = []
  alpha = ('a'..'z').to_a
  num = (1..9).to_a
  parts.each do |x|
    x.times {uuid << [alpha.sample, num.sample].sample}
    uuid << '-'
  end
  uuid.pop
  p uuid.join
end

uuid_creator
