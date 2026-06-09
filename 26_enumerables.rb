# Enumerables in Ruby
# The Enumerable module gives you a powerful set of iteration methods.
# Any class that defines .each gets all of these for free.

numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
words   = ["apple", "banana", "cherry", "date", "elderberry"]

# ─── map / collect ────────────────────────────────────────────────────────────
# Transforms every element, returns a NEW array.
puts "=== map ==="
doubled = numbers.map { |n| n * 2 }
puts doubled.inspect   # [6, 2, 8, 2, 10, 18, 4, 12, 10, 6]

lengths = words.map { |w| w.length }
puts lengths.inspect   # [5, 6, 6, 4, 10]

# ─── select / filter ─────────────────────────────────────────────────────────
# Keeps elements where the block returns true.
puts "\n=== select ==="
evens = numbers.select { |n| n.even? }
puts evens.inspect     # [4, 2, 6]

long_words = words.select { |w| w.length > 5 }
puts long_words.inspect

# ─── reject ───────────────────────────────────────────────────────────────────
# Opposite of select — keeps elements where block returns false.
puts "\n=== reject ==="
odds = numbers.reject { |n| n.even? }
puts odds.inspect

# ─── find / detect ────────────────────────────────────────────────────────────
# Returns the FIRST element where block is true (or nil).
puts "\n=== find ==="
first_big = numbers.find { |n| n > 5 }
puts first_big   # => 9

# ─── reduce / inject ─────────────────────────────────────────────────────────
# Collapses the array into a single value.
puts "\n=== reduce ==="
sum     = numbers.reduce(0) { |total, n| total + n }
product = numbers.reduce(1) { |total, n| total * n }
puts "Sum: #{sum}"
puts "Product: #{product}"

# Shorthand with a symbol
puts numbers.reduce(:+)   # same as summing

# ─── each_with_index ─────────────────────────────────────────────────────────
puts "\n=== each_with_index ==="
words.each_with_index do |word, index|
  puts "#{index}: #{word}"
end

# ─── each_with_object ────────────────────────────────────────────────────────
# Like reduce but you pass a mutable accumulator object.
puts "\n=== each_with_object ==="
word_lengths = words.each_with_object({}) do |word, hash|
  hash[word] = word.length
end
puts word_lengths.inspect

# ─── flat_map ────────────────────────────────────────────────────────────────
# map then flatten by one level.
puts "\n=== flat_map ==="
nested = [[1, 2], [3, 4], [5, 6]]
puts nested.map { |a| a }.inspect       # [[1,2],[3,4],[5,6]]
puts nested.flat_map { |a| a }.inspect  # [1,2,3,4,5,6]

# ─── group_by ────────────────────────────────────────────────────────────────
puts "\n=== group_by ==="
grouped = numbers.group_by { |n| n.even? ? :even : :odd }
puts "Evens: #{grouped[:even].inspect}"
puts "Odds:  #{grouped[:odd].inspect}"

# ─── sort and sort_by ────────────────────────────────────────────────────────
puts "\n=== sort / sort_by ==="
puts numbers.sort.inspect
puts words.sort_by { |w| w.length }.inspect   # sort by word length

# ─── min, max, minmax ─────────────────────────────────────────────────────────
puts "\n=== min / max ==="
puts "Min: #{numbers.min}"
puts "Max: #{numbers.max}"
puts "MinMax: #{numbers.minmax.inspect}"

# ─── count ────────────────────────────────────────────────────────────────────
puts "\n=== count ==="
puts "Total: #{numbers.count}"
puts "Count of 5s: #{numbers.count(5)}"
puts "Count > 4: #{numbers.count { |n| n > 4 }}"

# ─── any? / all? / none? ─────────────────────────────────────────────────────
puts "\n=== any? / all? / none? ==="
puts "Any > 8?  #{numbers.any? { |n| n > 8 }}"
puts "All > 0?  #{numbers.all? { |n| n > 0 }}"
puts "None < 0? #{numbers.none? { |n| n < 0 }}"

# ─── zip ──────────────────────────────────────────────────────────────────────
puts "\n=== zip ==="
a = [1, 2, 3]
b = ["one", "two", "three"]
puts a.zip(b).inspect   # [[1,"one"],[2,"two"],[3,"three"]]

# ─── tally ────────────────────────────────────────────────────────────────────
puts "\n=== tally (Ruby 2.7+) ==="
puts numbers.tally.inspect  # counts occurrences of each element
