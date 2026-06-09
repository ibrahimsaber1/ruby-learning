

languages = ["Ruby", "Python", "JavaScript"]
puts "Initial array: #{languages}"

languages.push("Java")
puts "pushing java >>  #{languages}" # pushing add an element to the end of the array
# => ["Ruby", "Python", "JavaScript", "Java"]

languages << "C++" 
puts "pushing c++ >>  #{languages}"
# => ["Ruby", "Python", "JavaScript", "Java", "C++"]

languages.unshift("Go") # unshift add an element to the beginning of the array
puts "unshift >>  #{languages}"
# => ["Go", "Ruby", "Python", "JavaScript", "Java", "C++"]

languages.insert(2, "Swift") # insert add an element at a specific index, in this case we are adding "Swift" at index 2
puts "inserting swift >>  #{languages}"
# => ["Go", "Ruby", "Swift", "Python", "JavaScript", "Java", "C++"]