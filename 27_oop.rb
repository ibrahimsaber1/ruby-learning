# Object-Oriented Programming in Ruby
# Ruby is a PURE object-oriented language — everything is an object.

# ─── DEFINING A CLASS ─────────────────────────────────────────────────────────
puts "=== Basic Class ==="

class Animal
  # Class-level variable (shared across ALL instances)
  @@count = 0

  # attr_accessor creates getter + setter for you automatically
  # attr_reader  => getter only
  # attr_writer  => setter only
  attr_accessor :name, :age
  attr_reader   :species

  # Constructor — called when you do Animal.new(...)
  def initialize(name, age, species)
    @name    = name     # instance variable — unique to each object
    @age     = age
    @species = species
    @@count  += 1
  end

  # Instance method
  def speak
    puts "#{@name} makes a sound."
  end

  def info
    puts "#{@name} is a #{@species}, #{@age} years old."
  end

  # Class method — called on the class itself, not an instance
  def self.count
    puts "Total animals created: #{@@count}"
  end

  # Override to_s so puts gives a nice description
  def to_s
    "#{@name} (#{@species})"
  end
end

dog = Animal.new("Rex", 3, "Dog")
cat = Animal.new("Whiskers", 5, "Cat")

dog.speak
cat.info
puts dog.name      # getter
dog.name = "Max"   # setter
puts dog           # calls to_s => "Max (Dog)"
Animal.count       # class method

# ─── INHERITANCE ──────────────────────────────────────────────────────────────
puts "\n=== Inheritance ==="

class Dog < Animal   # Dog inherits everything from Animal
  attr_accessor :breed

  def initialize(name, age, breed)
    super(name, age, "Dog")   # call parent's initialize
    @breed = breed
  end

  # Override parent method
  def speak
    puts "#{@name} says: Woof!"
  end

  def fetch(item)
    puts "#{@name} fetches the #{item}!"
  end
end

rex = Dog.new("Rex", 3, "Labrador")
rex.speak          # uses Dog's speak, not Animal's
rex.fetch("ball")
rex.info           # inherited from Animal
puts rex.is_a?(Animal)  # => true  (Rex IS an Animal)
puts rex.is_a?(Dog)     # => true
puts rex.class          # => Dog

# ─── MODULES (Mixins) ────────────────────────────────────────────────────────
# Ruby has no multiple inheritance, but modules let you mix in shared behavior.

puts "\n=== Modules / Mixins ==="

module Swimmable
  def swim
    puts "#{@name} is swimming!"
  end
end

module Flyable
  def fly
    puts "#{@name} is flying!"
  end
end

class Duck < Animal
  include Swimmable
  include Flyable

  def initialize(name)
    super(name, 1, "Duck")
  end

  def speak
    puts "#{@name} says: Quack!"
  end
end

donald = Duck.new("Donald")
donald.speak
donald.swim
donald.fly

# ─── PRIVATE & PROTECTED ─────────────────────────────────────────────────────
puts "\n=== Access Control ==="

class BankAccount
  def initialize(balance)
    @balance = balance
  end

  def show_balance
    puts "Balance: $#{format_balance}"   # can call private method internally
  end

  def >(other)
    balance_value > other.balance_value  # protected allows comparison between instances
  end

  protected

  def balance_value
    @balance
  end

  private

  def format_balance
    sprintf("%.2f", @balance)
  end
end

account = BankAccount.new(1500.5)
account.show_balance
# account.format_balance   # => NoMethodError: private method

# ─── COMPARABLE MODULE ────────────────────────────────────────────────────────
puts "\n=== Comparable ==="

class Box
  include Comparable

  attr_accessor :volume

  def initialize(volume)
    @volume = volume
  end

  # Comparable requires you to define <=> (the spaceship operator)
  def <=>(other)
    @volume <=> other.volume
  end
end

boxes = [Box.new(10), Box.new(5), Box.new(20), Box.new(1)]
sorted = boxes.sort
puts sorted.map(&:volume).inspect   # [1, 5, 10, 20]
puts boxes.min.volume               # 1
puts boxes.max.volume               # 20
