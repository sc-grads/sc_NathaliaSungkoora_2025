# LESSON 7: DISPLAYING TEXT AND CALCULATIONS TOGETHER

# STRINGS VS NUMBERS
# Strings are enclosed in quotes
print("Hello, world")
# Output: Hello, world

print("My favorite drink is Earl Grey tea")
# Output: My favorite drink is Earl Grey tea

# Numbers are written without quotes
print(42)
# Output: 42

print(3.14)
# Output: 3.14

# Use print() to display data
print("Hello, World!")
# Output: Hello, World!

# Use Python as a calculator
print(3 * 4.5)
# Output: 13.5
# --------------------------------

# F-STRINGS: MIXING TEXT AND CALCULATIONS
# Without f-string: just displays the formula as text
print("The temperature 75F in degrees Celsius is ((75 - 32) * 5 / 9)C")
# Output: The temperature 75F in degrees Celsius is ((75 - 32) * 5 / 9)C

# With f-string: displays the calculated value
print(f"The temperature 75F in degrees Celsius is {(75 - 32) * 5 / 9}C")
# Output: The temperature 75F in degrees Celsius is 23.88888888888889C
# --------------------------------

# FORMATTING NUMBERS IN F-STRINGS
# Regular string
print("Isabel is 28 years old.")
# Output: Isabel is 28 years old.

# F-string with calculation
print(f"Isabel is {28 / 7} dog years old.")
# Output: Isabel is 4.0 dog years old.

# F-string with no decimal places
print(f"Isabel is {28 / 7:.0f} dog years old.")
# Output: Isabel is 4 dog years old.
# --------------------------------

# MULTI-LINE F-STRINGS
print(f"""
    Most countries use the metric system for recipe measurement, 
    but American bakers use a different system. For example, they use 
    fluid ounces to measure liquids instead of milliliters (ml).

    So you need to convert recipe units to your local measuring system!

    For example, 8 fluid ounces of milk is {8 * 29.5735} ml.
    And 100ml of water is {100 / 29.5735} fluid ounces.
""")
# Output:
#     Most countries use the metric system for recipe measurement, 
#     but American bakers use a different system. For example, they use 
#     fluid ounces to measure liquids instead of milliliters (ml).
#
#     So you need to convert recipe units to your local measuring system!
#
#     For example, 8 fluid ounces of milk is 236.588 ml.
#     And 100ml of water is 3.381405650328842 fluid ounces.
# --------------------------------

# EXTRA PRACTICE - LESSON 7

# Modify the code to print your age
print(f"I am {25} years old.")
# Output: I am 25 years old.

# Fix this code to display the number of weeks in a year
print(f"There are {365 / 7} weeks in a year")
# Output: There are 52.142857142857146 weeks in a year

# Complete the code to calculate area of a square
print(f"The area of a square with side 5 cm is {5 * 5} cm squared.")
# Output: The area of a square with side 5 cm is 25 cm squared.

# Modify the code to display one decimal place for metric conversion
print(f"The house was a good size: 1200 square feet, or {1200 * 0.092903:.1f} meters squared!")
# Output: The house was a good size: 1200 square feet, or 111.5 meters squared!

