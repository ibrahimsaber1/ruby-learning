# Symbols
# A symbol is an immutable string that is often used as a unique identifier.
# Symbols are created by prefixing a string with a colon (:).
# Symbols are more memory-efficient than strings because they are stored only once in memory.

name = :Alice
age = :thirty
city = :New_York

puts name
puts age
puts city


# Symbols are immutable
puts "*" * 10
puts "Symbols are immutable:"
puts name.object_id
puts age.object_id
puts city.object_id  

# similar symbols have the same object_id
puts "*" * 10
puts "Similar symbols have the same object_id:"
puts :Alice.object_id
puts :thirty.object_id