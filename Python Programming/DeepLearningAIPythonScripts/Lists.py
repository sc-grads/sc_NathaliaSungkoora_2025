# LESSON 1: COMPLETING A TASK LIST WITH AI
# ----------------------------------------

from helper_functions import print_llm_response, get_llm_response

# Variables review
name = "Isabel"

# Generate birthday poem using a prompt
prompt = f"""
Write a four line birthday poem for my friend {name}. 
The poem should be inspired by the first letter of my friend's name.
"""
print_llm_response(prompt)
# Output (example, may vary):
# Infinite joy and laughter,  
# Shining bright like a star,  
# A friend like no other,  
# Beloved Isabel, you are.

# Creating a list of friends
friends_list = ["Tommy", "Isabel", "Daniel"]
print(friends_list)
# Output: ['Tommy', 'Isabel', 'Daniel']

print(type(friends_list))
# Output: <class 'list'>

print(len(friends_list))
# Output: 3

# Use list in prompt
prompt = f"""
Write a set of four line birthday poems for my friends {friends_list}. 
The poems should be insipred by the first letter of each friend's name.
"""
print(prompt)
print_llm_response(prompt)
# Output: One poem per friend, each with 4 lines 

# Accessing individual elements
first_friend = friends_list[0]
print(first_friend)
# Output: Tommy

print(friends_list[1])
# Output: Isabel

# Index out of range error example
# print(friends_list[3])  # Uncommenting this will cause IndexError

print(friends_list[2])
# Output: Daniel

# Adding to the list
friends_list.append("Otto")
print(friends_list)
# Output: ['Tommy', 'Isabel', 'Daniel', 'Otto']

# Add another friend
friends_list.append("Sarah")
print(friends_list)
# Output: ['Tommy', 'Isabel', 'Daniel', 'Otto', 'Sarah']

# Removing a friend
friends_list.remove("Sarah")
print(friends_list)
# Output: ['Tommy', 'Isabel', 'Daniel', 'Otto']

# List with numbers
list_ages = [42, 28, 30]
print(list_ages)
# Output: [42, 28, 30]

# List of tasks (multi-line strings allowed)
list_of_tasks = [
    "Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.",
    "Write a birthday poem for Otto, celebrating his 28th birthday.",
    "Write a 300-word review of the movie 'The Arrival'."
]

# Use tasks one by one
task = list_of_tasks[0]
print_llm_response(task)
# Output: Email to boss 

task = list_of_tasks[1]
print_llm_response(task)
# Output: Birthday poem 

task = list_of_tasks[2]
print_llm_response(task)
# Output: 300-word review 

# ----------------------------------------
# EXTRA PRACTICE

# 1. List of favorite movies
movie_list = ["Shrek", "Shrek 2", "Shrek The Third", "Shrek Forever After", "Shrek New"]

# 2. Print the fourth element of a list
prime_numbers = [2, 3, 5, 7, 11]
print(prime_numbers[3])
# Output: 7

# 3. Append to friends_list
friends_list = ["Tommy", "Isabel", "Daniel", "Otto"]
friends_list.append("Sarah")
print(friends_list)
# Output: ['Tommy', 'Isabel', 'Daniel', 'Otto', 'Sarah']

# 4. Remove a country not in South America
countries_in_south_america = ["Colombia", "Peru", "Brasil", "Japan", "Argentina"]
countries_in_south_america.remove("Japan")
print(countries_in_south_america)
# Output: ['Colombia', 'Peru', 'Brasil', 'Argentina']
