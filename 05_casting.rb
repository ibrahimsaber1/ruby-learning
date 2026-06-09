# Data type conversions / casting

=begin
In Ruby, you can convert between different data types using built-in methods. Here are some common
data type conversions:
- to_i: Converts a string to an integer.
- to_f: Converts a string to a float.
- to_s: Converts an object to a string.
- to_a: Converts an object to an array.
- to_h: Converts an object to a hash. 
- to_sym: Converts a string to a symbol.
- to_c: Converts a string to a complex number.
- to_r: Converts a string to a rational number.
=end

puts "123.to_i >> #{123.to_i}"     # => 123
puts "3.14.to_i >> #{3.14.to_i}"     # => 3.14
puts "123.to_s >> #{123.to_s}"        # => "123"
puts "[1, 2, 3].to_s >> #{[1, 2, 3].to_s}"   # => "[1, 2, 3]"
puts "hello.to_sym >> #{"hello".to_sym}"   # => :hello
puts "1.9.to_c >> #{"1.9".to_c}"      # => (1+2i) 
puts "1/3.to_r >> #{(1/3).to_r}"     # => (0/1)