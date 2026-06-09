# Blocks, Procs, and Lambdas in Ruby
# These are all ways to wrap chunks of code and pass them around.

# ─── BLOCKS ───────────────────────────────────────────────────────────────────
# A block is an anonymous chunk of code you pass to a method.
# It is NOT an object — you can't store it in a variable.
# Syntax: do...end (multi-line) or { } (single-line)

puts "=== Blocks ==="

# Using a block with .each
[1, 2, 3].each do |num|
  puts "Block got: #{num}"
end

# yield lets a method hand control TO the block
def run_block
  puts "Before yield"
  yield           # calls the block passed by the caller
  puts "After yield"
end

run_block { puts "Inside the block!" }

# yield with arguments
def shout
  yield("hello")
end

shout { |word| puts word.upcase }

# block_given? — safely check if a block was passed
def optional_block
  if block_given?
    yield
  else
    puts "No block given."
  end
end

optional_block { puts "Block provided!" }
optional_block

# ─── PROCS ────────────────────────────────────────────────────────────────────
# A Proc IS an object — you can store it, pass it, and call it later.

puts "\n=== Procs ==="

square = Proc.new { |x| puts x ** 2 }
square.call(4)   # => 16
square.call(7)   # => 49

# Pass a proc to a method with &
def apply(value, &action)
  action.call(value)
end

apply(5) { |n| puts "Proc via &: #{n * 10}" }

# Proc ignores extra/missing arguments (lenient)
lenient = Proc.new { |a, b| puts "a=#{a}, b=#{b}" }
lenient.call(1)        # b is nil — no error
lenient.call(1, 2, 3)  # extra arg ignored — no error

# ─── LAMBDAS ─────────────────────────────────────────────────────────────────
# A Lambda is a special Proc that:
#   1. Checks the number of arguments (strict)
#   2. Has its own return scope (return inside lambda ≠ return from method)

puts "\n=== Lambdas ==="

greet = lambda { |name| puts "Hello, #{name}!" }
greet.call("Ibrahim")

# Arrow syntax (Ruby 1.9+) — same thing, cleaner
double = ->(x) { x * 2 }
puts double.call(6)   # => 12
puts double.(6)       # alternative call syntax
puts double[6]        # another alternative

# Lambda is strict about arguments
strict = lambda { |a, b| puts "#{a} + #{b} = #{a + b}" }
strict.call(3, 4)
# strict.call(3)    # would raise: wrong number of arguments

# ─── PROC vs LAMBDA ──────────────────────────────────────────────────────────
puts "\n=== Proc vs Lambda return behavior ==="

def proc_return
  p = Proc.new { return "from proc" }
  p.call
  "after proc"  # never reached — proc's return exits the METHOD
end

def lambda_return
  l = lambda { return "from lambda" }
  l.call
  "after lambda"  # this IS reached — lambda's return is local to the lambda
end

puts proc_return    # => "from proc"
puts lambda_return  # => "after lambda"

# ─── STORING AND REUSING ─────────────────────────────────────────────────────
puts "\n=== Reusing a block as a Proc ==="

multiply = ->(x, y) { x * y }

[1, 2, 3, 4, 5].map { |n| multiply.(n, 3) }.each { |r| puts r }
