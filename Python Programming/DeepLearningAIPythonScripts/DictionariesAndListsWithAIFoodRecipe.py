
# Dictionaries and Lists with AI Food Recipe
from helper_functions import print_llm_response, get_llm_response

# Food preference dictionary for Tommy
food_preferences_tommy = {
    "dietary_restrictions": "vegetarian",
    "favorite_ingredients": ["tofu", "olives"],
    "experience_level": "intermediate",
    "maximum_spice_level": 6
}

# Print dictionary keys
print(food_preferences_tommy.keys())
# Output: dict_keys(['dietary_restrictions', 'favorite_ingredients', 'experience_level', 'maximum_spice_level'])

# Print dictionary values
print(food_preferences_tommy.values())
# Output: dict_values(['vegetarian', ['tofu', 'olives'], 'intermediate', 6])

#------------------------------------------------------------------------------------------------
# Reading values from the dictionary
# Accessing individual elements
#------------------------------------------------------------------------------------------------

from helper_functions import print_llm_response, get_llm_response

# Food preference dictionary for Tommy
food_preferences_tommy = {
    "dietary_restrictions": "vegetarian",
    "favorite_ingredients": ["tofu", "olives"],
    "experience_level": "intermediate",
    "maximum_spice_level": 6
}

# Creating a prompt using dictionary values
prompt = f"""Please suggest a recipe that tries to include 
the following ingredients: 
{food_preferences_tommy["favorite_ingredients"]}.
The recipe should adhere to the following dietary restrictions:
{food_preferences_tommy["dietary_restrictions"]}.
The difficulty of the recipe should be: 
{food_preferences_tommy["experience_level"]}
The maximum spice level on a scale of 10 should be: 
{food_preferences_tommy["maximum_spice_level"]} 
Provide a two sentence description.
"""

# Print the prompt
print(prompt)
# Output:
# Please suggest a recipe that tries to include 
# the following ingredients: 
# ['tofu', 'olives'].
# The recipe should adhere to the following dietary restrictions:
# vegetarian.
# The difficulty of the recipe should be: 
# intermediate
# The maximum spice level on a scale of 10 should be: 
# 6 
# Provide a two sentence description.

# Use LLM to get a recipe suggestion based on the prompt
print_llm_response(prompt)
# Sample Output:
# ____________________________________________________________________________________________________
# Try making a Mediterranean Tofu and Olive Stir-Fry. Sauté cubed tofu with bell peppers, garlic, and a mix of green and black olives, then season with oregano and a splash of lemon juice for a flavorful, vegetarian dish that balances savory and tangy notes.
# ____________________________________________________________________________________________________

# List of available spices
available_spices = ["cumin", "turmeric", "oregano", "paprika"]

# Refined prompt including available spices
prompt = f"""Please suggest a recipe that tries to include 
the following ingredients: 
{food_preferences_tommy["favorite_ingredients"]}.
The recipe should adhere to the following dietary restrictions:
{food_preferences_tommy["dietary_restrictions"]}.
The difficulty of the recipe should be: 
{food_preferences_tommy["experience_level"]}
The maximum spice level on a scale of 10 should be: 
{food_preferences_tommy["maximum_spice_level"]} 
Provide a two sentence description.

The recipe should not include spices outside of this list:
Spices: {available_spices}
"""

# Print the refined prompt
print(prompt)
# Output:
# Please suggest a recipe that tries to include 
# the following ingredients: 
# ['tofu', 'olives'].
# The recipe should adhere to the following dietary restrictions:
# vegetarian.
# The difficulty of the recipe should be: 
# intermediate
# The maximum spice level on a scale of 10 should be: 
# 6 
# Provide a two sentence description.
#
# The recipe should not include spices outside of this list:
# Spices: ['cumin', 'turmeric', 'oregano', 'paprika']

# Get recipe from LLM considering available spices
recipe = get_llm_response(prompt)

# Print the recipe
print(recipe)
# Sample Output:
# **Mediterranean Tofu and Olive Stir-Fry**
#
# Sauté cubed tofu until golden, then add a mix of olives, bell peppers, and onions, seasoning with cumin, oregano, and paprika for a flavorful Mediterranean twist. Serve over quinoa or rice for a hearty vegetarian meal that balances savory and tangy notes.

# Adding a boolean key-value pair for dietary restriction alternative
food_preferences_tommy["is_vegetarian"] = True

# Print updated dictionary
print(food_preferences_tommy)
# Output:
# {'dietary_restrictions': 'vegetarian', 'favorite_ingredients': ['tofu', 'olives'], 'experience_level': 'intermediate', 'maximum_spice_level': 6, 'is_vegetarian': True}

#------------------------------------------------------------------------------------------------
# EXTRA PRACTICE - CUSTOM RECIPE PROMPT WITH DETAILED INSTRUCTIONS
#------------------------------------------------------------------------------------------------

# Update the following dictionary with your own preferences

my_food_preferences = {
    "dietary_restrictions": ["Vegan"],  # List with dietary restrictions
    "favorite_ingredients": ["Cumin", "Onions", "Potatoes"],  # List with top three favorite ingredients
    "experience_level": "Professional",  # Experience level
    "maximum_spice_level": 10  # Spice level in a scale from 1 to 10
}

print(my_food_preferences)
# Output:
# {'dietary_restrictions': ['Vegan'], 'favorite_ingredients': ['Cumin', 'Onions', 'Potatoes'], 
# 'experience_level': 'Professional', 'maximum_spice_level': 10}

from helper_functions import print_llm_response, get_llm_response

# Modify the following prompt to include detailed recipe instructions 
# without adding more than two sentences.
prompt = f"""Please suggest a recipe that tries to include 
the following ingredients: 
{my_food_preferences["favorite_ingredients"]}.
The recipe should adhere to the following dietary restrictions:
{my_food_preferences["dietary_restrictions"]}.
The difficulty of the recipe should be: 
{my_food_preferences["experience_level"]}
The maximum spice level on a scale of 10 should be: 
{my_food_preferences["maximum_spice_level"]} 
Provide a two sentence description, followed by detailed cooking instructions.
"""

# Get recipe suggestion from LLM based on prompt
my_food_preferences_response = get_llm_response(prompt)

# Print the response from the LLM
print_llm_response(my_food_preferences_response)

#------------------------------------------------------------------------------------------------
# Sample output:
# Enjoy a flavorful Vegan Cumin-Spiced Potato Stew that brings out the natural sweetness of onions.
# This hearty dish combines tender potatoes simmered with cumin and caramelized onions, 
# perfect for a professional cook.
# 
# Instructions:
# 1. Heat oil in a pot and sauté chopped onions until golden brown.
# 2. Add diced potatoes, cumin, and vegetable broth, then simmer until potatoes are tender.
# 3. Season to taste and serve hot with fresh herbs.
