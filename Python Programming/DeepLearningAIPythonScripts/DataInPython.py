# LESSON 6: DATA IN PYTHON

# STRINGS
# Strings are used to store and manipulate text

print("Hello, World")
# Output: Hello, World

print("My favorite drink is Earl Grey tea.")
# Output: My favorite drink is Earl Grey tea.

print("¯\\_(ツ)_/¯")
# Output: ¯\_(ツ)_/¯

print("2.99")
# Output: 2.99
# --------------------------------

# MULTILINE STRINGS
# Triple quotes allow strings to span multiple lines

print("""Hello, World!
      It's great to be here!""")
# Output:
# Hello, World!
#       It's great to be here!

# The following will cause a SyntaxError if uncommented:
# print("Hello, World!
#       It's great to be here!")
# --------------------------------

# TYPE CHECKING
# Use type() to check the type of any data

print(type("Nathalia"))
# Output: <class 'str'>

print(type("""
Numbers, text, and truth,
Strings, ints, and floats in our code,
Data shapes our path
"""))
# Output: <class 'str'>

print(type("2.99"))
# Output: <class 'str'>

print(type(100))
# Output: <class 'int'>

print(type(2.99))
# Output: <class 'float'>
# --------------------------------

# PYTHON AS A CALCULATOR
# You can use Python to do arithmetic

print(28+35+43+50+65+70+68+66+75+80+95)
# Output: 675

# Compute compound interest: 1.05 raised to the power of 10
print(1.05 ** 10)
# Output: 1.628894626777442
# --------------------------------

# ORDER OF OPERATIONS
# Python follows the arithmetic order of operations (PEMDAS)

# Incorrect order (without parentheses)
print(75 - 32 * 5 / 9)
# Output: 57.22222222222222

# Correct order using parentheses
print((75 - 32) * 5 / 9)
# Output: 23.88888888888889
# --------------------------------

# EXPLORE AND TRY
# Try out strings, types, and multiline strings

print("There are 366 days in a leap year")
# Output: There are 366 days in a leap year

type(2350+9999/(10/5))
# Output: float

print("""This is line one.
This is line two.
This is line three.""")
# Output:
# This is line one.
# This is line two.
# This is line three.
# --------------------------------

# ERROR HANDLING
# Fix syntax errors in string formatting

print("There are 366 days in a leap year")
# Output: There are 366 days in a leap year

print("""There are 366" 
      days in a leap year""")
# Output:
# There are 366 days in a leap year
# --------------------------------

# UNIT CONVERSION
# Convert 6 feet to meters (1 foot = 0.3048 meters)

print(6*0.3048)
# Output: 6 feet is equal to 1.8288 meters
# --------------------------------
