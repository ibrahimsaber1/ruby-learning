
print("please enter your age: ")
user_age = gets.chomp.to_i

# if user_age < 18
#   puts "you are a minor grow up and come back :D"
# elsif user_age >= 18 and user_age <= 60;
#   puts "here u go "
# else
#   puts "RIP"
# end

unless user_age >= 18 and user_age <= 60;
puts 'go away'
else;
puts 'here u go'
end


name = nil
name ||= "Ibrahim" # this is the same as name = name || "Ibrahim"
puts name