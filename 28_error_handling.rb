# Error Handling in Ruby
# Ruby uses begin/rescue/ensure instead of try/catch/finally

# ─── BASIC RESCUE ─────────────────────────────────────────────────────────────
puts "=== Basic Rescue ==="

begin
  result = 10 / 0
rescue ZeroDivisionError => e
  puts "Caught an error: #{e.message}"
end

# ─── MULTIPLE RESCUE CLAUSES ──────────────────────────────────────────────────
puts "\n=== Multiple Rescue Clauses ==="

def risky_method(input)
  begin
    if input.nil?
      raise ArgumentError, "Input cannot be nil"
    end
    Integer(input)   # will raise TypeError or ArgumentError on bad input
  rescue ArgumentError => e
    puts "ArgumentError: #{e.message}"
  rescue TypeError => e
    puts "TypeError: #{e.message}"
  rescue => e
    # bare rescue catches StandardError and all subclasses
    puts "Some other error: #{e.message}"
  end
end

risky_method(nil)
risky_method("abc")
risky_method("42")

# ─── ENSURE ───────────────────────────────────────────────────────────────────
# ensure always runs, whether or not an error occurred — great for cleanup.
puts "\n=== Ensure ==="

def read_file(path)
  puts "Opening file: #{path}"
  begin
    raise "File not found: #{path}"
  rescue => e
    puts "Error: #{e.message}"
  ensure
    puts "Cleanup: closing file handle (always runs)"
  end
end

read_file("data.txt")

# ─── RETRY ────────────────────────────────────────────────────────────────────
# retry re-runs the begin block — useful for transient failures.
puts "\n=== Retry ==="

attempts = 0
begin
  attempts += 1
  puts "Attempt #{attempts}..."
  raise "Simulated network error" if attempts < 3
  puts "Success on attempt #{attempts}!"
rescue => e
  puts "Failed: #{e.message}"
  retry if attempts < 3
  puts "Giving up after #{attempts} attempts."
end

# ─── RAISE ────────────────────────────────────────────────────────────────────
puts "\n=== Raise ==="

def divide(a, b)
  raise ArgumentError, "Cannot divide by zero" if b == 0
  a / b
end

begin
  puts divide(10, 2)
  puts divide(10, 0)
rescue ArgumentError => e
  puts "Caught: #{e.message}"
end

# ─── CUSTOM EXCEPTIONS ────────────────────────────────────────────────────────
puts "\n=== Custom Exceptions ==="

class InsufficientFundsError < StandardError
  def initialize(amount, balance)
    super("Cannot withdraw $#{amount}. Balance is only $#{balance}.")
    @amount  = amount
    @balance = balance
  end
end

class BankAccount
  def initialize(balance)
    @balance = balance
  end

  def withdraw(amount)
    raise InsufficientFundsError.new(amount, @balance) if amount > @balance
    @balance -= amount
    puts "Withdrew $#{amount}. New balance: $#{@balance}"
  end
end

account = BankAccount.new(100)
begin
  account.withdraw(50)
  account.withdraw(200)
rescue InsufficientFundsError => e
  puts "Error: #{e.message}"
end

# ─── RESCUE IN METHODS (no begin needed) ─────────────────────────────────────
puts "\n=== Inline Rescue ==="

def safe_divide(a, b)
  a / b
rescue ZeroDivisionError
  puts "Can't divide by zero!"
  0
end

puts safe_divide(10, 2)
puts safe_divide(10, 0)

# One-liner rescue (use sparingly)
value = Integer("abc") rescue "not a number"
puts value
