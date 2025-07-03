# LESSON 9: BUILDING LLM PROMPTS WITH VARIABLES
# ---------------------------------------------

from helper_functions import print_llm_response

# Ask a simple question
print_llm_response("What is the capital of France?")
# Output: The capital of France is Paris.

# Use variables in a prompt
name = "Otto Matic"
dog_age = 21 / 7

print_llm_response(f"""If {name} were a dog, he would be {dog_age} years old.
Describe what life stage that would be for a dog and what that might 
entail in terms of energy level, interests, and behavior.""")
# Output: Young adult dog with high energy, playful, needs activity

# Fix variable names and use them in a story prompt
driver = "unicorn"
driver_vehicle = "colorful, asymmetric dinosaur car"
favorite_planet = "Pluto"

print_llm_response(f"""Write me a 300 word children's story about a {driver} racing
a {driver_vehicle} for the {favorite_planet} champion cup.""")
# Output: Story about Sparkle the unicorn and Roary the dinosaur car racing

# Fix a broken print statement with string formatting
favorite_book = "1001 Ways to Wear a Hat"
second_fav_book = "2002 Ways to Wear a Scarf"

print(f"My most favorite book is {favorite_book}, but I also like {second_fav_book}")
# Output: My most favorite book is 1001 Ways to Wear a Hat, but I also like 2002 Ways to Wear a Scarf

# Use personal preferences to get a song recommendation
favorite_game = "Uno"
favorite_movie = "Shrek"
favorite_food = "Sushi"

print_llm_response(f"""My favorite game is {favorite_game},
                    my favorite movie is {favorite_movie}, and my favorite food is {favorite_food}.
                    Based on these, can you recommend a new song I might enjoy?
""")
# Output: Suggests "All Star" by Smash Mouth
