# Ruby Internals: Object Identity, Freeze, and Memory
# Understanding how Ruby manages objects under the hood.

# ─── OBJECT_ID ────────────────────────────────────────────────────────────────
# Every Ruby object has a unique object_id.
# But some objects are ALWAYS the same object (Integers, Symbols, true/false/nil).
puts "=== object_id ==="

puts true.object_id     # always 2
puts false.object_id    # always 0
puts nil.object_id      # always 8

# Integers: object_id = 2n + 1
puts 1.object_id        # => 3
puts 2.object_id        # => 5
puts 100.object_id      # => 201

# Strings — each literal creates a NEW object
a = "hello"
b = "hello"
puts a.object_id == b.object_id   # => false! different objects

# Symbols — same symbol = same object, always
puts :hello.object_id == :hello.object_id   # => true

# ─── FREEZE ───────────────────────────────────────────────────────────────────
# freeze makes an object immutable. Mutating it raises FrozenError.
puts "\n=== freeze ==="

str = "mutable".freeze
puts str.frozen?    # => true

begin
  str << " suffix"
rescue => e
  puts "Error: #{e.message}"   # can't modify frozen String
end

# Frozen string literal (performance best practice for string constants)
CONSTANT = "I never change".freeze
puts CONSTANT

# ─── dup vs clone ─────────────────────────────────────────────────────────────
puts "\n=== dup vs clone ==="

original = "hello".freeze

duped  = original.dup    # dup copies, strips frozen state
cloned = original.clone  # clone copies, PRESERVES frozen state

puts "dup frozen?   #{duped.frozen?}"    # => false
puts "clone frozen? #{cloned.frozen?}"  # => true

duped << " world"   # works fine
puts duped

# ─── OBJECT TYPES AND INTROSPECTION ──────────────────────────────────────────
puts "\n=== Introspection ==="

class Vehicle
  def drive; end
end

class Car < Vehicle
  def honk; end
end

car = Car.new

puts car.class                        # => Car
puts car.class.superclass             # => Vehicle
puts car.is_a?(Vehicle)              # => true
puts car.kind_of?(Vehicle)           # => true (alias of is_a?)
puts car.instance_of?(Car)           # => true
puts car.instance_of?(Vehicle)       # => false (strict: exact class)

puts car.respond_to?(:drive)         # => true
puts car.respond_to?(:fly)           # => false

# List all methods
puts "\nInstance methods (Car-specific):"
puts (Car.instance_methods - Object.instance_methods).inspect

# Ancestors chain
puts "\nAncestors:"
puts Car.ancestors.inspect

# ─── EQUAL? / == / eql? / equal? ─────────────────────────────────────────────
puts "\n=== Equality ==="

a = "hello"
b = "hello"
c = a

puts "== (value equal):    #{a == b}"      # true — same value
puts "eql? (strict ==):    #{a.eql?(b)}"  # true — same type and value
puts "equal? (same object): #{a.equal?(b)}" # false — different objects
puts "equal? (same object): #{a.equal?(c)}" # true — same object (c points to a)

# Numbers: == is lenient, eql? is strict
puts "\n1 == 1.0:    #{1 == 1.0}"     # true
puts "1.eql?(1.0): #{1.eql?(1.0)}"   # false (Integer vs Float)
