# Ranges in Ruby
# A Range represents a sequence between a start and an end value.

# ─── CREATING RANGES ──────────────────────────────────────────────────────────
puts "=== Creating Ranges ==="

inclusive = (1..10)    # includes 10
exclusive = (1...10)   # excludes 10 (stops at 9)

puts "Inclusive last: #{inclusive.last}"   # => 10
puts "Exclusive last: #{exclusive.last}"   # => 9

# Works with letters too
alpha = ("a".."f")
puts alpha.to_a.inspect   # ["a", "b", "c", "d", "e", "f"]

# ─── RANGE MEMBERSHIP ─────────────────────────────────────────────────────────
puts "\n=== Membership ==="

puts (1..100).include?(42)    # => true
puts (1..100).include?(101)   # => false

# === is what case/when uses under the hood
puts ((1..10) === 5)    # => true
puts ((1..10) === 15)   # => false

# ─── ITERATING ────────────────────────────────────────────────────────────────
puts "\n=== Iteration ==="

(1..5).each { |n| print "#{n} " }
puts

# step — iterate with a custom step
(0..20).step(5) { |n| print "#{n} " }
puts

# ─── RANGES AND ARRAYS ────────────────────────────────────────────────────────
puts "\n=== Ranges → Arrays ==="

puts (1..5).to_a.inspect
puts ("a".."e").to_a.inspect

# Array slicing with a range
arr = ["a", "b", "c", "d", "e", "f"]
puts arr[1..3].inspect    # ["b", "c", "d"]
puts arr[2...5].inspect   # ["c", "d", "e"]

# ─── RANGES IN CASE/WHEN ──────────────────────────────────────────────────────
puts "\n=== Ranges in case/when ==="

def grade(score)
  case score
  when 90..100 then "A"
  when 80...90 then "B"
  when 70...80 then "C"
  when 60...70 then "D"
  else              "F"
  end
end

[95, 82, 73, 61, 45].each do |score|
  puts "Score #{score} => #{grade(score)}"
end

# ─── ENDLESS RANGE (Ruby 2.6+) ────────────────────────────────────────────────
puts "\n=== Endless Range ==="

puts (18..).include?(100)    # => true  (any number 18 and above)
puts (..0).include?(-50)     # => true  (beginless range: 0 and below)
