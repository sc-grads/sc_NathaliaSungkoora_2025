# LESSON 10: FUNCTIONS - ACTIONS ON DATA
# --------------------------------------

from helper_functions import *

# Print a shrug emoji
print("¯\\_(ツ)_/¯")
# Output: ¯\_(ツ)_/¯

# Ask LLM about the capital of France
print_llm_response("What is the capital of France?")
# Output: The capital of France is Paris.

# Check the type of a number
print(type(17))
# Output: <class 'int'>

# Count characters in a string
print(len("Hello World!"))
# Output: 12

# Round a float
print(round(42.17))
# Output: 42

# Store result of len in a variable
string_length = len("Hello World!")
print(string_length)
# Output: 12

# Create a prompt with variables and round()
name = "Tommy"
potatoes = 4.75
prompt = f"""Write a couplet about my friend {name} who has about {round(potatoes)} potatoes"""
response = get_llm_response(prompt)
print(response)
# Output: 
# Tommy's got five potatoes, quite a sight,
# In his hands, they're heavy, but his heart is light.

# --------------------------------------
# EXAM PRACTICE: FUNCTIONS

# Multiply a favorite number and print result
fav_num = 7
lucky_number = fav_num * 10
print(f"Your lucky number is {lucky_number}!")
# Output: Your lucky number is 70!

# Make the LLM write a poem using print_llm_response()
number_of_lines = 5
prompt = f"Write a {number_of_lines}-line poem about nature."
print_llm_response(prompt)
# Output:
# In the forest's embrace, whispers of the wind,
# Mountains stand tall, their wisdom unconfined.
# Rivers flow freely, a dance of pure grace,
# Sunlight filters through leaves, a gentle embrace.
# Nature's beauty, a timeless embrace.

# Same as above, but use get_llm_response() and then print()
number_of_lines = 5
prompt = f"Write a {number_of_lines}-line poem about the beauty of nature."
response = get_llm_response(prompt)
print(response)
# Output:
# In forests deep, the trees stand tall and proud,
# Their leaves whisper secrets to the passing breeze.
# Mountains rise, their peaks kissed by the sun,
# Rivers flow, their waters clear and free.
# Nature's beauty, a timeless symphony.
