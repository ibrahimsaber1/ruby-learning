# comparison operators in ruby
a = 5
b = 10

puts "#{a} == #{b} : #{a == b}"   # => false
puts "#{a} != #{b} : #{a != b}"   # => true
puts "#{a} > #{b} : #{a > b}"     # => false
puts "#{a} < #{b} : #{a < b}"     # => true
puts "#{a} >= #{b} : #{a >= b}"   # => false
puts "#{a} <= #{b} : #{a <= b}"   # => true
puts "#{a} <=> #{b} : #{a <=> b}" # => -1 (a is less than b)
puts "#{a} === #{b} : #{a === b}"   # => false (used in case statements and for class comparison)
