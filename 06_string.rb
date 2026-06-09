# note all the changes u see below dose not change the original text variable 
# if u want to change it use a bang method like upcase! or downcase!

text = "hello world"

puts "uppercase: #{text.upcase}"
puts "lowercase: #{text.downcase}"
puts "capitalize: #{text.capitalize}"
puts "reverse: #{text.reverse}"
puts "length: #{text.length}"
puts "include 'hello'? #{text.include?('hello')}"
puts "include 'ruby'? #{text.include?('ruby')}"
puts "index of 'o': #{text.index('o')}"
puts "index of 'l': #{text.index('l')}"
puts "index of 'z': #{text.index('z')}"
puts "replace 'world' with 'ruby': #{text.gsub('world', 'ruby')}"
puts "split by space: #{text.split(' ')}"
puts "strip: #{text.strip}"
puts "chomp: #{text.chomp('d')}"
puts "chomp: #{text.chomp('o')}"

puts "*" * 10
# multiline string

multiline = <<com
  This is a multiline string.
  It can span multiple lines.
  It preserves the formatting.
com

puts multiline