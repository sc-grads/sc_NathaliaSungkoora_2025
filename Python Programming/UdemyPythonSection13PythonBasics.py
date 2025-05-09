#PYTHON BASICS (SECTION 13)

#-----------------------------------------------------------------
# DOC STRINGS

# """
# Docstrings Explained

# This module demonstrates the use of docstrings in Python, including module-level docstrings,
# class-level docstrings, and function-level docstrings. It also showcases the Sphinx markup
# for providing clear documentation.
# """

# class User:
#     """Base class for creating users."""

#     def __init__(self, user_id: int) -> None:
#         self.user_id = user_id

#     def show_id(self) -> None:
#         """Prints the user ID."""
#         print(self.user_id)

# def user_exists(user: User, database: set[User]) -> bool:
#     """
#     Checks if a user is inside a database.

#     :param user: The user to check for.
#     :param database:The database to check inside
#     :return: bool

#     """
#     return user in database

# def main() -> None:
#       # Creating users
#     bob: User = User(0)
#     anna: User  = User(1)

#      # Creating a database (set of users)
#     database: set[User] = {bob, anna}

#     # Checking if a user exists
#     if user_exists(bob, database):
#         print("User exists in the database.")
#     else:
#         print("No user found.")

#         # Printing docstrings (documentation printed)
#     print(User.__doc__)
#     print(user_exists.__doc__)    

# if __name__ =='__main__':
#     main()




#-----------------------------------------------------------------
# F-STRINGS (Formatted String Literals)

# # Debugging with F-Strings
# var: int = 10

# def add(a: int, b: int) -> int:
#     return a + b
# print(f'{var=}')# Output: var=10

# # Debugging with variable display
# print(f"{var}")  # Output: value = 10
# print(f"{add(5, 10) = }")  # Output: add(5, 10) = 15

# # Number Formatting
# big_number: float = 123456789
# print(f"{big_number:,}")  # Output: 12,345,6789
# print(f"{big_number:_}")  # Output: 12_345_6789

# # Fraction Formatting
# fraction: float = 1234.5678
# print(f"{fraction:.2f}")  # Output: 1234.57 (rounded to two decimals)
# print(f"{fraction:,.2f}")  # Output: 1,234.57

# # Percentage Formatting
# percent: float = 0.5555
# print(f"{percent:.2%}")  # Output: 55.55%

# # Alignment and Padding
# var: str = "BOB"
# print(f"{var: <10}")  # Left aligned
# print(f"{var: >10}")  # Right aligned
# print(f"{var: ^10}")  # Center aligned

# # Custom Fill Character
# print(f"{var:-<10}")  # Left fill with '-'
# print(f"{var:*>10}")  # Right fill with '*'
# print(f"{var:@^10}")  # Center fill with '@'

# # Formatting Large Numbers
# numbers = [1, 10, 100, 1000, 10000]
# for num in numbers:
#     print(f"{num:_>5}: counting!")
#     #OUTPUT: 
#         # ____1: counting!
#         # ___10: counting!
#         # __100: counting!
#         # _1000: counting!
#         # 10000: counting!

# # Raw String with F-Strings
# path: str = "\\Users\\Username\\Documents\\" #or path: str = "\Users\Username\Documents"
# print(path) # Output: \Users\Username\Documents\

# # Combining Raw and F-Strings
# user: str = "myusername"
# print(fr"C:\Users\{user}\Documents")
#     #Output: C:\Users\myusername\Documents



#-----------------------------------------------------------------
# ASSERTIONS    

# Assertion example

# def start_program(db: dict[int, str]) -> None:
#     # Ensure the database is not empty
#     assert db, 'Database is empty' #Only used for debugging
#     print('Database loaded', db)
#     print('Program started successfully!')

# def main() -> None:
#     # Sample database with data
#     db1: dict[int, str] = {0: 'A', 1: 'B'}
#     start_program(db=db1)  #Output: Program started successfully!


#     # Empty database example
#     db2: dict[int, str] = {}
#     start_program(db=db2)  # Raises AssertionError

#     # Assertion with another example
#     var: int = -5
#     # Ensure variable is positive
#     assert var > 0, f'{var} is not greater than zero' # Output: Error message

# if __name__ == '__main__':
#     main()



#-----------------------------------------------------------------
# UNPACKING   

# Multiple assignment example
# Assigning values to variables in a single line
# a, b = 5, 10
# print(f'a: {a}, b: {b}') # Output: a: 5, b: 10

# # Multiple assignments with more values
# a, b, c = 5, 10, 15
# print(f'a: {a}, b: {b}, c: {c}') # Output: a: 5, b: 10, c: 15

# # Unpacking a string
# x, y = 'AB'
# print(f'x: {x}, y: {y}') # Output: x: A, y: B


# # Using asterisk (*) for unpacking
# a, *b, c = 'ABCDEF'
# print(a,b,c) #output: A ['B', 'C', 'D', 'E'] F


# # Unpacking with underscore (_) for ignoring values
# *_, last = 'ABCDEF'
# print(last) # Output: f

# # Function using unpacking with a dictionary
# def add(a: int, b: int) -> None:
#     # Displaying the result of addition
#     print(f'{a + b= }')
# add(5,10) #Output: a + b= 15

# # Creating a dictionary with parameters
# numbers: dict[str, int]= {'a': 5, 'b': 10}
# # Unpacking dictionary directly in function call
# add(**numbers) # Output: 5 + 10 = 15

# # Using unpacking with list and dictionary in print function
# numbers: list[int] = [1, 2, 3, 4, 5]
# params: dict[str] ={'sep': ' - ', 'end': '.'}
# # Unpacking list and dictionary
# print(*numbers, **params) # Output: 1 - 2 - 3 - 4 - 5.




#-----------------------------------------------------------------
# EQUALITY(==) VS Identity(is)   
# Comparing values using equality operator

# a: int = 200
# b: int = 200
# print(a == b) # Output: True
# print(a is b)  # Output: True

# # Another example:
# # Comparing values to show they are not the same
# a: int = 1000
# b: int = int('1000')
# print(a == b) # Output: True
# print(a is b)  # Output: False
#                 #is : very unreliable for checking values

# # while they have the same value, they are not the same object:
# print(f'{id(a)=}') #Output: id(a)=1943437810160
# print(f'{id(b)=}') #Output: id(b)=1943437817072

# #---------
# #Another example:

# # Correct way to check for None using 'is'
# var: int | None = None
# if var is None:
#     print('There is no var')  # Output: There is no var
# else:
#     print(f'The var is {var}')

# # Demonstrating identity with custom objects
# class Animal:
#     pass

# #---------
# #Another example:
# cat = Animal()
# dog = Animal()

# print(cat is dog)  # Output: False
# print(cat is cat)  # Output: True

# # Displaying memory addresses for objects
# print(f'ID of cat: {id(cat)}, ID of dog: {id(dog)}')
#-----------------------------------------------------------------