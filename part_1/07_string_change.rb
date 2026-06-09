# sting changing in ruby using the bang methods

text = "hello world"

puts "uppercase: #{text.upcase!}"
puts "original text: #{text}"

puts "*-" * 10
puts "original text: #{text}"
puts "lowercase: #{text.downcase!}"
puts "original text: #{text}"