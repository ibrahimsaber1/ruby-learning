# String Formatting in Ruby
# Going beyond basic interpolation.

# ─── sprintf / format ────────────────────────────────────────────────────────
puts "=== sprintf / format ==="

# %d = integer, %f = float, %s = string, %x = hex
puts sprintf("%-15s %5d %8.2f", "Apple",   42,  3.14)
puts sprintf("%-15s %5d %8.2f", "Banana",   7, 19.99)
puts sprintf("%-15s %5d %8.2f", "Elderberry", 1, 0.50)

# format is an alias for sprintf
price = format("$%.2f", 1234.5)
puts price   # => $1234.50

# % operator shorthand
puts "Hello, %s! You are %d years old." % ["Ibrahim", 25]

# ─── PADDING & ALIGNMENT ─────────────────────────────────────────────────────
puts "\n=== Padding ==="

puts "42".rjust(10)          # right-align in 10 chars
puts "42".ljust(10, "-")     # left-align, pad with dashes
puts "42".center(10, "*")    # center between stars

# ─── HEREDOC ─────────────────────────────────────────────────────────────────
puts "\n=== Heredoc ==="

message = <<~TEXT
  Dear Ibrahim,

  This is a heredoc.
  The ~  strips leading whitespace so your indentation
  doesn't bleed into the string.

  Regards,
  Ruby
TEXT

puts message

# ─── STRING FORMATTING WITH NUMBERS ──────────────────────────────────────────
puts "=== Number Formatting ==="

big_number = 1_000_000   # underscores in number literals for readability
puts big_number           # => 1000000

puts "%08.3f" % 3.14     # zero-padded float
puts "%08d"   % 42       # zero-padded integer
puts "%x"     % 255      # hex => ff
puts "%o"     % 8        # octal => 10
puts "%b"     % 10       # binary => 1010
puts "%e"     % 12345.6789  # scientific notation

# ─── USEFUL STRING METHODS RECAP ─────────────────────────────────────────────
puts "\n=== Useful String Methods ==="

s = "  Hello, Ruby World!  "

puts s.strip                         # remove surrounding whitespace
puts s.strip.delete(",!")            # remove specific chars
puts s.strip.tr("aeiou", "*")        # transliterate vowels
puts "hello".center(21, "=-")        # center with custom padding
puts "Ha" * 3                        # repeat
puts "Ruby".chars.inspect            # split into characters array
puts "hello world".scan(/\w+/).inspect  # regex scan
puts "hello".start_with?("he")      # => true
puts "hello".end_with?("lo")        # => true
