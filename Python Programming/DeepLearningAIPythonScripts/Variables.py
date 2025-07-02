# LESSON 8: VARIABLES
# --------------------------------

# Assigning a value to a variable
age = 28
print(age)
# Output: 28

# Updating a variable's value
age = 5
print(age)
# Output: 5

# --------------------------------

# VARIABLES CAN STORE NUMBERS, STRINGS, FLOATS
name = "Otto"
gnome_height = 12.7

print(f"Age: {age}")
# Output: Age: 5

print(f"Name: {name}")
# Output: Name: Otto

print(f"Gnome height: {gnome_height}")
# Output: Gnome height: 12.7

# Case sensitivity error (this will crash)
# print(f"Gnome height: {Gnome_height}")  # Uncomment to see error
# Output: NameError: name 'Gnome_height' is not defined

# --------------------------------

# VARIABLES THAT STORE CHANGING VALUES (like a score)
score = 0
print(score)
# Output: 0

score = score + 50
print(score)
# Output: 50

score = score + 100
print(score)
# Output: 150

score = score + 300
print(score)
# Output: 450

print(f"Your final score was: {score}")
# Output: Your final score was: 450

# --------------------------------

# VARIABLE NAMING RESTRICTIONS
# Invalid variable name (this will crash)
# my score = 450  # Uncomment to see error
# Output: SyntaxError: invalid syntax

# --------------------------------

# USING VARIABLES TO MAKE CODE MORE EFFICIENT

# Without variables:
print(f"""Otto's dog age is {49/7}. So a dog that's about
{49/7} would be the same age as Otto. Any dog born about {49/7}
years ago would be in the same stage of life as Otto.""")
# Output: Otto's dog age is 7.0 ...

# With a variable:
dog_age = 49 / 7
print(f"""Otto's dog age is {dog_age}. So a dog that's about
{dog_age} would be the same age as Otto. Any dog born about {dog_age}
years ago would be in the same stage of life as Otto.""")
# Output: Otto's dog age is 7.0 ...

# Updating the variable:
dog_age = 50 / 7
print(f"""Otto's dog age is {dog_age}. So a dog that's about
{dog_age} would be the same age as Otto. Any dog born about {dog_age}
years ago would be in the same stage of life as Otto.""")
# Output: Otto's dog age is 7.142857...

# Also using a variable for the name:
name = "Otto Matic"
print(f"""{name}'s dog age is {dog_age}. So a dog that's about
{dog_age} would be the same age as {name}. Any dog born about {dog_age}
years ago would be in the same stage of life as {name}.""")
# Output: Otto Matic's dog age is 7.142857...

# --------------------------------

# Create a variable called 'my_name' and assign it the value of your name as a string.
# Then print out a greeting using the variable, like "Hello, Andrew!"
my_name = "Nathalia"
print(f"Hello, {my_name}!")
# Output: Hello, Nathalia!

# Enter your favorite number below and store it in a variable called 'fav_num'. 
# Print out a message telling you what your favorite number plus 10 is.
fav_num = 10
print(f"Your favorite number plus 10 is {fav_num + 10}")
# Output: Your favorite number plus 10 is 20

# Create two variables, 'countries_visited' and 'countries_to_visit'
# Assign the number of countries you've been to and hope to visit.
countries_visited = 4
countries_to_visit = 30

print(f"""I have visited {countries_visited} countries. I plan to visit {countries_to_visit} more countries, 
and when I'm done I will have visited {countries_to_visit + countries_visited} countries.""")
# Output:
# I have visited 4 countries. I plan to visit 30 more countries, 
# and when I'm done I will have visited 34 countries.
