
=begin
 Dictionary: Hash
  A hash is a collection of key-value pairs. 
  It allows you to store and retrieve data based on unique keys. 
  Hashes are also known as associative arrays or dictionaries in other programming languages. 
=end



# creating a hash
person = {
  "name" => "Alice",
  "age" => 30,
  "city" => "New York",
  "phone" => "123-456-7890"
}

# accessing values in a hash
# puts "Name: #{person["name"]}"
# puts "Age: #{person["age"]}"
# puts "City: #{person["city"]}"


# adding a new key-value pair to the hash
person["occupation"] = "Engineer"
# puts "Occupation: #{person["occupation"]}"

# looping through a hash

puts "*" * 10
# puts "Looping through a hash:"
# person.each do |key, value|
#   puts "#{key.capitalize}: #{value}"
# end



person.each_key do |key|
  puts key
end
puts "*" * 10

person.each_value do |value|
  puts value
end


# hash methods

puts "*" * 10
puts "Hash methods:"
puts "Keys: #{person.keys}"
puts "Values: #{person.values}"
puts "Has key 'name'? #{person.has_key?("name")}"
puts "Has key 'email'? #{person.has_key?("email")}"
puts "Has value 'Alice'? #{person.has_value?("Alice")}"
puts "Has value 'Bob'? #{person.has_value?("Bob")}"
puts "Size of hash: #{person.size}"
puts "Length of hash: #{person.length}"
puts "Is the hash empty? #{person.empty?}"

# ------------- 







