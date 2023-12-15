#num_people = as.integer(readline("Enter the number of people in the class: "))
num_people=28
# Function to calculate the probability of at least one shared birthday
calculate_shared_birthday_probability = function(num_people) {
  prob_no_shared_birthday = 1
  for (i in 1:num_people) {
    prob_no_shared_birthday = prob_no_shared_birthday * (365 - i + 1) / 365
  }
  return(1 - prob_no_shared_birthday)
}

# probability of at least one shared birthday
prob_shared_birthday = calculate_shared_birthday_probability(num_people)

# Calculate the expected number of pairs with shared birthdays
expected_shared_pairs = num_people * (num_people - 1) / 2 * prob_shared_birthday

print(paste("Probability of at least one shared birthday:", prob_shared_birthday))
#in a class of 28 students, there is approximately a 65.44% chance that at least two students will share the same birthday.

print(paste("Expected number of pairs with shared birthdays:", expected_shared_pairs))
#class with 28 students, the expected number of pairs with shared birthdays is around 247.39




