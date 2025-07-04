#BUILT-IN PACKAGES
# lesson2_built_in_packages.py
# Demonstrates using Python's built-in math, statistics, and random packages, plus helper function

# --- Math Package ---
# Import trigonometric functions and pi from math
from math import cos, sin, pi, floor

# Print pi and its type
print(pi)  # Output: 3.141592653589793
print(type(pi))  # Output: <class 'float'>

# Define values for trigonometric calculations
values = [0, pi/2, pi, 3/2*pi, 2*pi]

# Calculate cosine for each value
for value in values:
    print(f"The cosine of {value:.2f} is {cos(value):.2f}")
# Output: The cosine of 0.00 is 1.00
#         The cosine of 1.57 is 0.00
#         The cosine of 3.14 is -1.00
#         The cosine of 4.71 is -0.00
#         The cosine of 6.28 is 1.00

# Calculate sine for each value
for value in values:
    print(f"The sine of {value:.2f} is {sin(value):.2f}")
# Output: The sine of 0.00 is 0.00
#         The sine of 1.57 is 1.00
#         The sine of 3.14 is 0.00
#         The sine of 4.71 is -1.00
#         The sine of 6.28 is 0.00

# Use floor function to round down
print(floor(5.7))  # Output: 5

# --- Statistics Package ---
# Import statistical functions
from statistics import mean, stdev

# Define list of friends' heights
my_friends_heights = [160, 172, 155, 180, 165, 170, 158, 182, 175, 168]

# Calculate mean and standard deviation
print(mean(my_friends_heights))  # Output: 168.5
print(stdev(my_friends_heights))  # Output: 9.119576013536301

# --- Random Package ---
# Import sample function for random selection
from random import sample

# Define ingredient lists
spices = ["cumin", "turmeric", "oregano", "paprika"]
vegetables = ["lettuce", "tomato", "carrot", "broccoli"]
proteins = ["chicken", "tofu", "beef", "fish", "tempeh"]

# Select random ingredients
random_spices = sample(spices, 2)
random_vegetables = sample(vegetables, 2)
random_protein = sample(proteins, 1)

# Print selected ingredients
print(random_spices)  # Output: e.g., ['cumin', 'paprika']
print(random_vegetables)  # Output: e.g., ['lettuce', 'broccoli']
print(random_protein)  # Output: e.g., ['tempeh']

# --- Using Helper Function for Recipe ---
# Import helper function
from helper_functions import get_llm_response

# Create recipe prompt
prompt = f"""Please suggest a recipe that includes the following ingredients.
Spices: {random_spices}
Vegetables: {random_vegetables}
Proteins: {random_protein}"""

# Print prompt
print(prompt)
# Output: Please suggest a recipe that includes the following ingredients.
#         Spices: ['cumin', 'paprika']
#         Vegetables: ['lettuce', 'broccoli']
#         Proteins: ['tempeh']

# Generate and print recipe
recipe = get_llm_response(prompt)
print(recipe)
# Output: **Spiced Tempeh with Broccoli and Lettuce Salad**
#         **Ingredients:**
#         - 1 block tempeh, cubed
#         - 2 cups broccoli florets
#         - 1 head of lettuce, chopped
#         - 1 tsp cumin
#         - 1 tsp paprika
#         - [etc., as per previous static response]