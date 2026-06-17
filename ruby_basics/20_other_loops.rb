



# each loop with an array
puts "each loop with an array:"
[1, 2, 3, 4, 5].each do |num|
  puts "Number: #{num}"
end


# using next and break
puts "*" * 10
puts "Using next and break:"
for i in 1..10
  if i == 3
    next # skip the rest of the loop for this iteration
  end
  if i == 7

    puts "Breaking the loop at iteration #{i}"
    break # exit the loop entirely
  end
  puts "Iteration #{i}"
end

# using upto and downto
puts "*" * 10
puts "Using upto and downto:"
1.upto(5) do |i|
  puts "Upto iteration #{i}"
end

5.downto(1) do |i|
  puts "Downto iteration #{i}"
end
