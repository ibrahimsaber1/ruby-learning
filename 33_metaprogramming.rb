# Metaprogramming in Ruby
# "Code that writes code" — Ruby lets you define behavior dynamically at runtime.
# This is one of Ruby's most powerful (and dangerous) features.

# ─── OPEN CLASSES (Monkey Patching) ──────────────────────────────────────────
# In Ruby, ANY class can be reopened and modified — even built-in ones.
puts "=== Open Classes ==="

class Integer
  def factorial
    return 1 if self <= 1
    self * (self - 1).factorial
  end

  def times_do
    i = 0
    while i < self
      yield i
      i += 1
    end
  end
end

puts 5.factorial      # => 120
puts 0.factorial      # => 1

5.times_do { |i| print "#{i} " }
puts

class String
  def palindrome?
    clean = self.downcase.gsub(/\W/, "")
    clean == clean.reverse
  end
end

puts "racecar".palindrome?       # => true
puts "A man a plan a canal Panama".palindrome?  # => true
puts "hello".palindrome?         # => false

# ─── respond_to? and send ────────────────────────────────────────────────────
puts "\n=== respond_to? and send ==="

class Robot
  def walk;  puts "Walking..."; end
  def talk;  puts "Talking..."; end
  def beep;  puts "Beep boop!"; end

  private
  def reboot; puts "Rebooting..."; end
end

r = Robot.new

[:walk, :talk, :fly].each do |action|
  if r.respond_to?(action)
    r.send(action)            # call method by name (symbol)
  else
    puts "#{action}: not supported"
  end
end

# send can also call private methods (use with care!)
r.send(:reboot)

# ─── define_method ────────────────────────────────────────────────────────────
# Dynamically create methods at runtime.
puts "\n=== define_method ==="

class Logger
  ["info", "warn", "error", "debug"].each do |level|
    define_method("log_#{level}") do |message|
      puts "[#{level.upcase}] #{message}"
    end
  end
end

logger = Logger.new
logger.log_info("Server started")
logger.log_warn("Disk usage at 80%")
logger.log_error("Connection refused")

# ─── method_missing ───────────────────────────────────────────────────────────
# Called when Ruby can't find a method — use to handle unknown method calls gracefully.
puts "\n=== method_missing ==="

class DynamicHash
  def initialize
    @store = {}
  end

  # intercepts calls like .name=, .age=, .name, .age
  def method_missing(name, *args)
    key = name.to_s
    if key.end_with?("=")
      @store[key.chomp("=")] = args.first
    elsif @store.key?(key)
      @store[key]
    else
      super   # fall back to default behavior for unknown methods
    end
  end

  # always define respond_to_missing? alongside method_missing
  def respond_to_missing?(name, include_private = false)
    key = name.to_s.chomp("=")
    @store.key?(key) || super
  end
end

person = DynamicHash.new
person.name = "Ibrahim"
person.age  = 25
person.city = "Cairo"

puts person.name
puts person.age
puts person.city
puts person.respond_to?(:name)   # => true

# ─── instance_variable_get / set ─────────────────────────────────────────────
puts "\n=== Dynamic Instance Variables ==="

class Config
  def initialize(settings)
    settings.each do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.define_method(key) { instance_variable_get("@#{key}") }
    end
  end
end

config = Config.new(host: "localhost", port: 3000, debug: true)
puts config.host
puts config.port
puts config.debug
