# USING FILES IN PYTHON

from helper_functions import get_llm_response
from IPython.display import display, Markdown

# Generating a recipe from a list of ingredients
ingredients = ['chicken', 'broccoli', 'rice']

prompt = f"""
Create a short recipe that uses the following ingredients:
{ingredients}
"""

response = get_llm_response(prompt)
print(response)
# Output snippet:
# Chicken and Broccoli Rice Bowl
# Ingredients:
# - 1 lb chicken breast, diced
# - 2 cups broccoli florets
# - 1 cup rice (white or brown)
# Instructions:
# 1. Cook the rice...
# 2. Sauté the chicken...

# Opening a text file and reading it
f = open("email.txt", "r")
email = f.read()
f.close()

print(email)
# Output snippet:
# Subject: My Incredible Journey Around the World!
# Hi Andrew,
# I just returned from an incredible trip around the world...
# Best,
# Daniel

#-----------------------------------------------------------
# ========================================
# 1. Import Required Functions
# ========================================
from helper_functions import get_llm_response
from IPython.display import display, Markdown

# ========================================
# 2. Load Email Text from File
# ========================================
f = open("email.txt", "r")
email = f.read()
f.close()

# ========================================
# 3. Create LLM Prompt from Email Content

prompt = f"""Extract bullet points from the following email. 
Include the sender information. 

Email:
{email}"""

print(prompt) #Print the Prompt (Optional for Debugging)

# Output snippet:
# Extract bullet points from the following email.
# Include the sender information.
# Email:
# Subject: My Incredible Journey Around the World!
# Hi Andrew,
# I hope you are doing great! I just returned from an incredible trip...

# ========================================
# 5. Get LLM Response with Bullet Points
# ========================================
bullet_points = get_llm_response(prompt)

# ========================================
# 6. Print Bullet Points (Text Output)
# ========================================
bullet_points = get_llm_response(prompt)
print(bullet_points)
# Output snippet:
# - **Sender:** Daniel
# - **Subject:** My Incredible Journey Around the World!
# - **Trip Highlights:**
#   - New York: Broadway show and skyline
#   - Rio de Janeiro: Copacabana Beach...
#   - Cape Town: Natural beauty and safari adventures
#   ...
# - **Future Plans:** Share more stories and photos when catching up with Andrew.

# ========================================
# 7. Render Bullet Points in Markdown Format
# (Only works in Jupyter or environments that support display)
# ========================================
# Print in Markdown format
display(Markdown(bullet_points))
# Output snippet (rendered nicely in Markdown view):
# Sender: Daniel
# Subject: My Incredible Journey Around the World!
# Trip Highlights:
# - New York: Broadway show and skyline
# - Rio de Janeiro: Copacabana Beach...
# - Cape Town: Natural beauty and safari adventures


# ========================================
# EXTRA PRACTICE - Email Analysis with LLM
# ========================================

# Assumes `email` is already loaded from previous steps

# ========================================
# Exercise 1: Identify Countries in the Email
# ========================================
# Complete the code below to identify all of the countries mentioned 
# in the email
prompt = f"""Identify all the countries mentioned in

Email:
{email}
"""

countries = get_llm_response(prompt)
print(countries)
# Output snippet:
# The countries mentioned in the email are:
# 1. United States (New York)
# 2. Brazil (Rio de Janeiro)
# 3. South Africa (Cape Town)
# 4. France (Paris)
# 5. Turkey (Istanbul)
# 6. Japan (Tokyo)
# 7. Australia (Sydney)

# ========================================
# Exercise 2: List All Activities from the Trip
# ========================================
# Write code below to list all of the activities that Daniel did on 
# his trip. You'll need to create a prompt and use either 
# get_llm_response or print_llm_response
# START YOUR CODE HERE


prompt = f"""List all of the activities that Daniel did on his trip.

Email:
{email}
"""

activities = get_llm_response(prompt)
print(activities)

# Output snippet:
# 1. Enjoyed a Broadway show in New York
# 2. Viewed the skyline in New York
# 3. Soaked up the sun on Copacabana Beach in Rio de Janeiro
# 4. Hiked to Christ the Redeemer in Rio de Janeiro
# 5. Experienced natural beauty and safari adventures in Cape Town
# 6. Explored charming streets and enjoyed delicious food in Paris
# 7. Visited Hagia Sophia in Istanbul
# 8. Took a Bosphorus cruise in Istanbul
# 9. Experienced neon lights and enjoyed sushi in Tokyo
# 10. Visited the Opera House in Sydney
# 11. Relaxed at Bondi Beach in Sydney
