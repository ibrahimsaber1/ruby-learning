# Regular Expressions in Ruby
# Regex lets you search, match, and manipulate strings with patterns.
# Ruby has first-class regex support built in.

# ─── BASIC MATCHING ───────────────────────────────────────────────────────────
puts "=== Basic Matching ==="

email = "ibrahim@example.com"

# =~ returns the index of the first match, or nil
if email =~ /\w+@\w+\.\w+/
  puts "Valid email format"
end

# .match returns a MatchData object (or nil)
m = "Hello, Ibrahim!".match(/(\w+), (\w+)!/)
if m
  puts "Full match: #{m[0]}"   # "Hello, Ibrahim!"
  puts "Group 1:   #{m[1]}"   # "Hello"
  puts "Group 2:   #{m[2]}"   # "Ibrahim"
end

# .match? — just returns true/false, no MatchData overhead
puts "hello123".match?(/\d/)   # => true

# ─── COMMON PATTERNS ──────────────────────────────────────────────────────────
puts "\n=== Common Patterns ==="

# \d  digit,  \D non-digit
# \w  word char (letter/digit/_),  \W non-word
# \s  whitespace,  \S non-whitespace
# .   any char except newline
# ^   start of line,  $  end of line
# *   0 or more,  +  1 or more,  ?  0 or 1
# {n} exactly n,  {n,m} between n and m
# []  character class,  [^] negated class

patterns = {
  digits_only:  /^\d+$/,
  alpha_only:   /^[a-zA-Z]+$/,
  starts_with_A: /^A/,
  ends_with_ing: /ing$/
}

test_words = ["123", "hello", "APPLE", "Running", "42abc"]

test_words.each do |word|
  matches = patterns.select { |_, pattern| word.match?(pattern) }.keys
  puts "#{word.ljust(10)}: #{matches.inspect}"
end

# ─── scan ─────────────────────────────────────────────────────────────────────
puts "\n=== scan ==="

text = "My phone is 012-345-6789 or reach me at +20-100-200-3000"
phones = text.scan(/[\d\-\+]+/)
puts phones.inspect

words = "one two three four five".scan(/\b\w{3}\b/)   # 3-letter words
puts words.inspect

# ─── gsub with regex ──────────────────────────────────────────────────────────
puts "\n=== gsub with regex ==="

puts "hello   world".gsub(/\s+/, " ")       # collapse multiple spaces
puts "Hello World".gsub(/[aeiou]/i, "*")    # replace vowels (case-insensitive)

# gsub with a block — process each match
puts "john smith".gsub(/\b\w/) { |c| c.upcase }  # => "John Smith"

# Named capture groups
date = "2024-06-15"
if date =~ /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/
  puts "Year: #{$~[:year]}, Month: #{$~[:month]}, Day: #{$~[:day]}"
end

# ─── split with regex ─────────────────────────────────────────────────────────
puts "\n=== split with regex ==="

csv_messy = "one,two  ,  three ,four"
puts csv_messy.split(/\s*,\s*/).inspect    # handles spaces around commas

# ─── FLAGS ────────────────────────────────────────────────────────────────────
puts "\n=== Flags ==="

# /i  case-insensitive
# /m  multiline (. matches newline too)
# /x  extended mode (allows whitespace and comments in regex)

puts "HELLO" =~ /hello/i ? "case-insensitive match" : "no match"

email_regex = /
  \A            # start of string
  [\w+\-.]+     # username
  @             # at sign
  [a-z\d\-.]+  # domain
  \.            # dot
  [a-z]+        # TLD
  \z            # end of string
/ix

puts "test@example.com".match?(email_regex)    # => true
puts "not_an_email".match?(email_regex)         # => false
