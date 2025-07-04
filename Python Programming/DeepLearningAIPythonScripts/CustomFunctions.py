#CUSTOM FUNCTIONS IN PYTHON

# Turning Code Blocks into Reusable Functions
# How to create and use custom functions to avoid repetitive code.

# Importing necessary modules
from helper_functions import print_llm_response
from IPython.display import Markdown, display


#REVISITING FUNCTIONS ALREADY DEFINED
# Example of built-in functions

# Using print function to display text
print("Hello World!")
# Output: Hello World!

# Using len function to count items in a list
friends_list = ["Tommy", "Isabel", "Daniel", "Otto"]
print(len(friends_list))
# Output: 4

# Using helper function to query LLM
print_llm_response("What is the capital of France")
# Output: The capital of France is Paris.

# Defining a function to print journal content
# read in the Cape Town journal
f = open("cape_town.txt", "r")
journal_cape_town = f.read()
f.close()
print(journal_cape_town)
# Snippet of Output: My first destination was The Test Kitchen, a restaurant that has earned its place among the world's best. ...

# Using the print_journal function
# read in the Paris journal
f = open("paris.txt", "r")
journal_paris = f.read()
f.close()
print(journal_paris)
# Snippet of Output: My first stop was the legendary Le Comptoir du Relais in the heart of Saint-Germain-des-Prés....

#------------------------------------------------------------------

#DEFINE A FUNCTION AND STORE IN A VARIABLE

# Defining a function to print journal content
def print_journal(file):
    f = open(file, "r")
    journal = f.read()
    f.close()
    print(journal)
# Using the print_journal function to read and print journal content    
# Read in the Sydney journal
print_journal("sydney.txt")
#Snippet of Output:My culinary adventure began at Saint Peter, a renowned seafood restaurant in Paddington. ...    

#ANOTHER EXAMPLE OF A FUNCTION
# Defining a function to read and return journal content
def read_journal(file):
    f = open(file, "r")
    journal = f.read()
    f.close()
    return journal

# Using read_journal to store Tokyo journal content
journal_tokyo = read_journal("tokyo.txt")

# Printing Tokyo journal content
print(journal_tokyo)
# Snippet of Output: Tokyo's culinary landscape is nothing short of extraordinary...

# Checking the length of Tokyo journal content
print(len(journal_tokyo))
# Output: 1430

#-----------------------------------------------------------------------
#PARAMETERS IN FUNCTIONS


# Parameters in Functions
# How to create a function with parameters to convert Fahrenheit to Celsius.

# Defining the conversion function with a parameter
def fahrenheit_to_celsius(fahrenheit):
    # Calculation for converting Fahrenheit to Celsius
    celsius = (fahrenheit - 32) * 5 / 9
    # Print the formatted result
    print(f"{fahrenheit}°F is equivalent to {celsius:.2f}°C")

# Using the function with different temperature inputs
fahrenheit_to_celsius(71)
# Output: 71°F is equivalent to 21.67°C

fahrenheit_to_celsius(70)
# Output: 70°F is equivalent to 21.11°C

fahrenheit_to_celsius(212)
# Output: 212°F is equivalent to 100.00°C

#-----------------------------------------------------------------------
#RETURNING VALUES FROM FUNCTIONS


# Returning Values from Functions
# How to create a function that returns a value for temperature conversion.

# Defining the conversion function with a return statement
def fahrenheit_to_celsius(fahrenheit):
    celsius = (fahrenheit - 32) * 5 / 9
    # Return the calculated Celsius value
    return celsius

# Using the function to convert a temperature
fahrenheit = 45
celsius = fahrenheit_to_celsius(fahrenheit)

# Printing the result
print(celsius)
# Output: 7.222222222222222

# Checking the data type of the returned value
print(type(celsius))
# Output: <class 'float'>


#--------------------------------------------------------------------------
#EXTRA PRACTICE

#EXERCISE 1: Convert Celsius to Fahrenheit


def celsius_to_fahrenheit(celsius):
    fahrenheit = (celsius * 9/5) + 32
    print(fahrenheit)
    # WRITE YOUR CODE HERE

celsius_to_fahrenheit(0)   # Output: 32
celsius_to_fahrenheit(100) # Output: 212
celsius_to_fahrenheit(13)  # Output: 55.4


#EXERCISE 2: Converts a length in meters to a length in feet, then returns the result

def meters_to_feet(meters):
    feet = meters * 3.28084
    print(feet)
    # WRITE YOUR CODE HERE

print(meters_to_feet(10)) # Output: 32.8084
print(meters_to_feet(0.7)) # Output: 2.29659

#-----------------------------------------------------------------------------------------

#CHALLENGE EXERCISE
#Write a function that takes in a filename as a parameter, 
# uses an LLM to create a three bullet point summary, and returns the bullets as a string.

from helper_functions import get_llm_response

def create_bullet_points(file):
    # Complete code below to read in the file and store the contents as a string
    f = open(file, "r")
    file_contents = f.read()
    f.close()

    # Write a prompt and pass to an LLM
    prompt = f"""Create a three bullet point summary for the following text:
    {file_contents}
    Return the bullets as a string.
    """
    bullets = get_llm_response(prompt)

    # Return the bullet points
    return bullets

# This line of code runs your function for istanbul.txt and returns the output
output_bullets = create_bullet_points("istanbul.txt")

# Print the function output
print(output_bullets)


#OUTPUT:
# "My culinary journey in Istanbul included: 
# 1. Çiya Sofrası in Kadıköy, where I enjoyed the tender, spice-infused 'Kuzu Tandir' lamb dish. 
# 2. Karaköy Lokantası, known for its modern take on tradition, featuring delightful 'Midye Dolma' stuffed mussels. 
# 3. Asitane in Edirnekapı, specializing in Ottoman cuisine with the unique 'Mutancana' dish, and ending at Mikla for a stunning view and perfectly cooked 'Lamb Rump'."