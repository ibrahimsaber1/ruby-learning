# data types on ruby

# 1. Numbers
puts "Integer: #{42.class}"          # => Integer
puts "Float: #{3.14.class}"          # => Float
puts "Complex: #{1 + 2i.class}"     # => Complex
puts "Rational: #{Rational(1, 3).class}" # => Rational

# 2. Strings
puts "String: #{\"Hello, World!\".class}" # => String

# 3. Symbols
puts "Symbol: #{:my_symbol.class}"   # => Symbol

# 4. Arrays
puts "Array: #{[1, 2, 3].class}"    # => Array

# 5. Hashes
puts "Hash: #{ {key: 'value'}.class }" # => Hash

# 6. Booleans
puts "Boolean true: #{true.class}"   # => TrueClass
puts "Boolean false: #{false.class}"  # => FalseClass

# 7. Nil
puts "Nil: #{nil.class}"             # => NilClass