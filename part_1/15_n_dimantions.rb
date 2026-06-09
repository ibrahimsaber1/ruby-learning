=begin
  [[1, 2, 3],
   [4, 5, 6],
   [7, 8, 9]]
=end


grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

puts grid[0][0] # => 1
puts grid[1][1] # => 5
puts grid[2][1] # => 8

grid[0][0] = 10
puts grid[0][0] # => 10

# puts grid