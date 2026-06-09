# boolean operators in ruby
=begin
Boolean operators:
== (equality)
&& (logical AND)
|| (logical OR)
! (logical NOT)
=end

a = true
b = false

puts "a == b: #{a == b}"  # => false
puts "a AND b: #{a && b}"  # => false
puts "a OR b: #{a || b}"   # => true
puts "NOT a: #{!a}"         # => false
puts "NOT b: #{!b}"         # => true
