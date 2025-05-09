# PYTHON ADVANCED (SECTION 16)
#-----------------------------------------------------------------------------

# MYPY

# Incorrect type assignment
var: str = 123  # This should be a string, but it's an integer.

# List with wrong type
items: list[str] = ["apple", "banana", True]  # Boolean is not a string.


#---------------------------------------------------------------------------

#WALRUS OPERATOR (:=)

# # Function that provides a description of a list of numbers
# def description(numbers: list[int]) -> dict:
#     # Using the walrus operator to calculate and assign values in one step
#     details: dict ={
#         'length': (n_len := len(numbers)),             # Length of the list
#         'sum': (n_sum := sum(numbers)),                 # Sum of the list
#         'mean': n_sum / n_len if n_len > 0 else 0      # Mean value of the list
#     }
#     return details

# def main() -> None:
#     #numbers: list[int] = [1, 10, 5, 200, -4, 7]
#     #print(description(numbers)) # Output: {'length': 6, 'sum': 219, 'mean': 36.5}
# #Simplify code:
#     print(x := 1>0) #Output: True

# if __name__ == '__main__':
#     main()    

#---------------------------------------------------------------------------

# LAMBDAS
# from typing import Callable

# # Basic Lambda Example
# p = lambda x: print(x)

# # Using the lambda function
# p(10)  # Output: 10
# p("Hello")  # Output: Hello

# # Lambda with Multiple Parameters
# add = lambda a, b: a + b
# print(add(4, 12))  # Output: 16


# # Function that uses a Callable (can be a lambda)
# def use_all(f: Callable, values: list[int]) -> None:
#     for value in values:
#         f(value)

# # Using a Lambda with the use_all function
# use_all(lambda value: print(f"{value* 'X'}"), [2, 4, 10])

# # Regular Function Equivalent (to use more than once)
# def multiply_x(value: int) -> None:
#     print(f"{value* 'X'}")

#         #Outputs are the same : X XXXX XXXXXX


# # Using the regular function
# use_all(multiply_x, [2, 4, 10])


# #ANOTHER EXAMPLE:
# # Sorting with Lambda
# names: list[str] = ["Bob", "James", "Samantha", "Luigi", "Joe"]
# sorted_names: list[str] = sorted(names, key=lambda x: len(x))
# print(sorted_names)  # Output: ['Bob', 'Joe', 'James', 'Luigi', 'Samantha']

# # Sorting while ignoring case
# names = ["bob", "James", "samantha", "luigi", "Joe"]
# sorted_names = sorted(names, key=lambda x: len(x.lower()))
# print(sorted_names)


#---------------------------------------------------------------------------

# GENERATORS
# Anything function that yields a value turns into a generator

# from typing import Generator

# # Simple generator function
# def five_numbers() -> Generator:
#     for i in range(1, 6):
#         yield i

# # Using the generator
# numbers: Generator= five_numbers()
# print('Next values from generator:')
# print(next(numbers))  # Output: 1
# print(next(numbers))  # Output: 2
# print(next(numbers))  # Output: 3

# # Remaining values
# print(list(numbers))  # Output: [4, 5]

# # Large data generator
# def huge_data() -> Generator:
#     for i in range(100_000_000_000):
#         yield i

# # Creating huge data generator
# data: Generator = huge_data()

# for i in range(5):
#     print(next(data))

# # Vowel generator
# def generate_vowels() -> Generator[str, None, None]:
#     vowels = 'aeiou'
#     for vowel in vowels:
#         yield vowel

# vowels = generate_vowels()

# print(next(vowels))  # a
# print(next(vowels))  # e
# print(next(vowels))  # i


# for vowel in vowels:
#     print(vowel)

# # Handling StopIteration error
# try:
#     print(next(vowels))  # Error
# except StopIteration:
#     print('Generator is empty.')

#-----------------------------------------------------------------------------------------------

# MATCH CASE

# Example 1: Basic Status Matching
# status: int = 200

# # Using match-case for basic status handling
# match status:
#     case 200:
#         print("Connected") # Output: Connected
#     case 403:
#         print("Forbidden")
#     case 404:
#         print("Not Found")
#     case _:
#         print("Unknown") # for every other case
# #-------------------------------
# # Example 2: Advanced Pattern Matching with Commands
# while True:
#     user_input: str = input("Enter a command: ")
#     command: list[str] =user_input.split()
# #---
# #print(command)
#     #Output: Enter a command: find image.png
#                     #['find', 'image.png']
# #---
#     match command:
#             case ["find", *images]:
#              print(f"Finding images: {images}")

#             case ["enlarge", image, amount]:
#              print(f"You enlarged {image} by {amount}x")

#             case ["rename", image, new_name] if len(new_name) > 3:
#                 print(f"{image} was renamed to {new_name}")

#             case ["download", *images]:
#              print(f"Downloading images: {images}")

#             case ["delete" | "x", *images]:
#                 print(f"Deleting images: {images}")

#             case _:
#              print("Command not found.")


#---------------------------------------------------------------------------------------------

#DECORATORS

import time
from typing import Callable
from functools import wraps

# Decorator to time a function
def get_time(func: Callable) -> Callable:
    """Times how long it takes to execute a function."""
    
   
    def wrapper(*args, **kwargs)->None:
        start_time: float = time.perf_counter()  # Record start time
        calculate() # Execute the function or func(*args, **kwargs)   
        end_time: float = time.perf_counter()    # Record end time

        # Calculate and print the time taken
    
        print(f'Time: {end_time- start_time:.3f} s')
         
    return wrapper

# Function to demonstrate the decorator
@get_time
def calculate():
    """Calculates() docstring"""
    print('Calculating...')
    for i in range(20_000_000):  # Simulate a time-consuming task
        pass
    print("Done")

# Main entry point
def main() -> None:
    calculate()

if __name__ == '__main__':
    main()    
