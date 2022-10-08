require 'digest'

input = "iwrupvqb"
md5 = Digest::MD5.new
md5 << input

i = 1

loop do
  break if md5.hexdigest.to_s[0..5] == '000000'
  # part 1 5 digits part 2 6
  i += 1
  md5.reset
  md5 << "#{input}#{i}"
end

p i
p md5.hexdigest

# look into =~ operator seems like magic
