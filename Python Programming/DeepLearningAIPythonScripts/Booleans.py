# BOOLEANS IN PYTHON

#Comparing data in Python
from helper_functions import print_llm_response, get_llm_response

# INTRODUCING BOOLEAN VALUES
# A boolean is a data type that has only two values: True or False.

# EXAMPLE: ADDING A BOOLEAN TO A DICTIONARY
food_preferences_tommy = {
    "favorite_ingredients": ["mushrooms", "olives"],
    "experience_level": "intermediate",
    "maximum_spice_level": 6
}

# Add a new boolean value to the dictionary
food_preferences_tommy["is_vegetarian"] = True

# Print the full dictionary
print(food_preferences_tommy)

# TRUE AND FALSE VALUES
# True and False are not strings—they are boolean values.
print(True)
print(False)

# CHECKING DATA TYPE
# You can confirm the data type using type()
print(type(True))    # Output: <class 'bool'>
print(type(False))   # Output: <class 'bool'>

# ASSIGNING BOOLEAN TO VARIABLES
# You can store True or False in a variable just like any other data type.
is_tommy_my_friend = True
is_isabel_older_than_me = False

# Print the boolean values
print(is_tommy_my_friend) # Output: True
print(is_isabel_older_than_me) # Output: False

# Check the type
print(type(is_isabel_older_than_me))  # Output: <class 'bool'>

#-------------------------------------------------------------------------------------

# COMPARISON OPERATORS IN PYTHON

#Comparing data in Python 

# COMPARING VALUES RETURNS BOOLEANS
# Booleans are the result of comparing variables.

# Define ages for three people
isabel_age = 28
daniel_age = 30
tommy_age = 30

# EXAMPLE: GREATER THAN >
# Is Isabel older than Daniel?
print(isabel_age > daniel_age)     # Output: False

# EXAMPLE: LESS THAN <
# Is Isabel younger than Daniel?
print(isabel_age < daniel_age)     # Output: True

# You can store the result of a comparison in a variable
is_isabel_older_than_daniel = isabel_age > daniel_age
print(is_isabel_older_than_daniel) # Output: False

# EXAMPLE: LESS THAN OR EQUAL TO <=
print(isabel_age <= daniel_age)    # Output: True

# EXAMPLE: TOMMY AND DANIEL HAVE SAME AGE
# Let's try comparisons with tommy_age and daniel_age
print(tommy_age < daniel_age)      # Output: False
print(tommy_age <= daniel_age)     # Output: True

#-----------------------------------------------------------

# EQUALITY OPERATOR IN PYTHON

# = vs ==
# = is the assignment operator (assigns values to variables)
# == is the comparison operator (checks if two values are equal)

# Using == to compare ages
print(tommy_age == daniel_age)    # Output: True
print(isabel_age == daniel_age)   # Output: False

# Using == to compare strings
print("vegetarian" == "vegan")    # Output: False
print("vegan" == "vegan")         # Output: True

#-----------------------------------------------------------

# LOGICAL OPERATORS IN PYTHON

# Define boolean variables
is_tommy_my_friend = True
is_isabel_my_friend = True

# Using 'and' to check if both are friends
print(is_tommy_my_friend and is_isabel_my_friend)  # Output: True

# Using 'or' to check if at least one is a friend
print(is_tommy_my_friend or is_isabel_my_friend)   # Output: True

# Age comparison game example
isabel_age = 28
daniel_age = 30
tommy_age = 29

# Check if Isabel is younger than both Tommy and Daniel
is_isabel_younger_than_tommy = isabel_age < tommy_age
is_isabel_younger_than_daniel = isabel_age < daniel_age

print(is_isabel_younger_than_tommy and is_isabel_younger_than_daniel)  # Output: True

#-----------------------------------------------------------
# EXTRA PRACTICE: COMPARISONS AND LOGICAL OPERATORS

# Check whether Isabel is older than at least one of my friends (Tommy and Daniel)
# Age comparison game example
isabel_age = 28
daniel_age = 30
tommy_age = 29

# Replace the "?" with the correct comparison operator
is_isabel_older_than_tommy = isabel_age > tommy_age
is_isabel_older_than_daniel = isabel_age > daniel_age

# Use logical operators "and" or "or" as appropriate
print(is_isabel_older_than_tommy or is_isabel_older_than_daniel)  # Output: False

#-----------------------------------------------------------
