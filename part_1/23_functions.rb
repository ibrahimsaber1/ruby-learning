# functions on ruby
=begin
 - start with 'def' keyword
  - followed by the function name and parameters (if any)
  - end with 'end' keyword
=end
# defining a function
def greet(name)
  puts "Hello, #{name}!"
end

# calling a function
greet("Alice")

def add(a, b)
  return a + b
end

result = add(5, 3)
puts "The sum of 5 and 3 is: #{result}"

# we dont have to use return keyword, the last evaluated expression will be returned by default
def multiply(a, b)
  a * b
end

result = multiply(4, 6)
puts "The product of 4 and 6 is: #{result}"

# ------------------ using split operator to define a function with multiple parameters
def sum(*args)
  args.reduce(0) { |total, num| total + num }
end

result = sum(1, 2, 3, 4, 5)
puts "The sum of 1, 2, 3, 4, and 5 is: #{result}"


def splat_arguments(*args)
  puts "You passed #{args.length} arguments: #{args.join(', ')}"
end








