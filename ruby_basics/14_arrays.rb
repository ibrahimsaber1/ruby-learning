# arrays

=begin
two ways you can create an array in ruby:
- via Class => 'Array.new'
- via Literal => [1,2,3]

note: arrays in ruby are dynamic, meaning they can grow and shrink in size as needed. 
You can add or remove elements from an array using various methods 
such as 'push', 'pop', 'shift', 'unshift', etc.

also arrays in ruby can hold elements of different data types, 
including numbers, strings, and even other arrays.

=end

array1 = Array.new(5 ,'lol') # creates an array of size 5 with all elements initialized to nil
array2 = [1, 2, "hello", [4, 5, 6]]

# puts "array1: #{array1}"
# puts "array2: #{array2}"

# puts array1

# puts array1.size # returns the number of elements in the array
# puts array2.length # returns the number of elements in the array


# accessing elements in an array is done using the index, which starts at 0.
# puts array1[0] # returns the first element of the array
# puts array2[1] # returns the second element of the array
# puts "array2[-1]: #{array2[-1]}" # returns the last element of the array
# puts "array2[-2]: #{array2[-2]}" # returns the last element of the array

# puts array2[-2]


# sclicing an array is done using the range operator '..' or '...'
puts array2[0..2] # returns the first three elements of the array [start_index..end_index] includes the end_index
puts array2[0...2] # returns the first three elements of the array [start_index...end_index] excludes the end_index
puts array2[1..-1] # returns all elements of the array except the first one [start_index..-1] includes the last element
puts array2[1,3] # returns three elements starting from index 1 [start_index, length]