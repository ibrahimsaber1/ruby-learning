# strings as arrays

=begin
  
rescue 
=end

new_string = "Hi Ibrahim"

# puts new_string[0]
# puts new_string[1]

# puts "*-"*20

# # the [index, length] syntax allows you to extract a substring from a string. The index specifies the starting position of the substring, and the length specifies the number of characters to include in the substring.
# puts new_string[3,4]
# puts "*-"*20

# # you can also use negative indices to access characters from the end of the string. For example, new_string[-1] will give you the last character of the string, and new_string[-2] will give you the second-to-last character.
# puts new_string[-1]
# puts new_string[-2]
# puts "*-"*20  


# puts "dose i in the string? #{new_string.include?('i')}"
# puts "dose z in the string? #{new_string.include?('z')}"

puts "*-" * 20

puts new_string.split(" ")

# to replace a character in a string, you can use the gsub method. The gsub method takes two arguments: the first is the character or substring you want to replace, and the second is the character or substring you want to replace it with. For example, new_string.gsub('i', 'u') will replace all occurrences of 'i' with 'u' in the string.
puts new_string.gsub('a', 'u')
