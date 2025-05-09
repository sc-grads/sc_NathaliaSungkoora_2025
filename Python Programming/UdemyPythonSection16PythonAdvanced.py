# PYTHON ADVANCED (SECTION 16)
#-----------------------------------------------------------------------------

# MYPY

# Incorrect type assignment
# var: str = 123  # This should be a string, but it's an integer.

# # List with wrong type
# items: list[str] = ["apple", "banana", True]  # Boolean is not a string.


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

# import time
# from typing import Callable
# from functools import wraps

# # Decorator to time a function
# def get_time(func: Callable) -> Callable:
#     """Times how long it takes to execute a function."""
    
#     @wraps(func)  # Properly using the wraps decorator
#     def wrapper(*args, **kwargs) -> None:
#         start_time: float = time.perf_counter()  # Record start time
#         func(*args, **kwargs)  # Execute the function
#         end_time: float = time.perf_counter()    # Record end time

#         # Calculate and print the time taken
#         print(f'Time: {end_time - start_time:.3f} s')
    
#     return wrapper

# # Function to demonstrate the decorator
# @get_time
# def calculate():
#     """Calculates() docstring"""
#     print('Calculating...')
#     for i in range(20_000_000):  # Simulate a time-consuming task
#         pass  # or time.sleep(3)
#     print("Done")

# # Main entry point
# def main() -> None:
#     calculate()

# if __name__ == '__main__':
#     main()#---

#---------------------------------------------------------------------------------------------

#DECORATORS (CONTINUED)

# from typing import Callable, Any
# from functools import wraps

# # Decorator factory to repeat function calls
# def repeat(number: int) -> Callable:
#     """Repeat a function call x amount of times."""
    
#     def decorator(func: Callable) -> Callable:
#         @wraps(func)  # Preserve metadata
#         def wrapper(*args, **kwargs) -> Any | None:
#             value: Any =None
#             for _ in range(number):
#                 value = func(*args, **kwargs)  # Call the function
#             return value  # Return the final value

#         return wrapper

#     return decorator

# # Function to demonstrate the decorator
# #@repeat(number=3)  # Repeat the function 3 times
# #def greet(name: str) -> None:
#     #"""A function used to greet people."""
#     #print(f'Hello, {name}!')

# # Main entry point
# #def main() -> None:
#     #greet('Bob')  # Should print the greeting 3 times 
#                     #Output: Hello, Bob! (three times)

#     # Using the decorator on a function that returns a value
#     @repeat(2)
#     def add(a: int, b: int) -> int:
#         """A function used to add two numbers."""
#         print(f'{a+b=}')
#         return a + b

#     # Testing the add function
#     def main() -> None:
#         result: int = add(1, 2)
#         print(result)
#         #output: a+b=3 (three times) and the result: 3

#  # Checking if the function metadata is preserved
#     print(add.__name__) #Output: add
#     print(add.__doc__) #Output:A function used to add two numbers.
   

#     if __name__ == '__main__':
#         main()


#---------------------------------------------------------------------------------------------

# ENUM

from enum import Enum

# # Defining an enum for device state
# class State(Enum): #Represents device states
    
#     OFF = 0
#     ON = 1

# # Using the State enum (can change state here-affecting result)
# state: State = State.OFF #Output=The device is turned off.

# # Checking device state
# if state == State.ON:
#     print('The device is turned on.')
# elif state == State.OFF:
#     print('The device is turned off.')
# else:
#     print('Unknown input...')

#     #Output=The device is turned off.
#-------------------------
#ANOTHER EXAMPLE (1):
# Defining another enum for colors
# class Colour(Enum): # Represents color options
   
#     RED: str = 'R'
#     GREEN: str ='G'
#     BLUE: str ='B'

# # Using the Color enum
# red: Colour = Colour.RED
# print(red)           #Output: Colour.RED
# print(red.value)     #Output: R
# print(red.name)      #Output: RED
# print(Colour('R'))   #Output: Colour.RED

# # ANOTHER EXAMPLE (2):
# # Function that uses an enum parameter
# def buy_car(brand: str, colour: Colour) -> None:
#   #Buy a car with a specific colour.
#     if colour == Colour.RED:
#         print(f'You bought a smoking hot red {brand}.')
#     elif colour == Colour.GREEN:
#         print(f'You bought an eco-friendly green {brand}.')
#     elif colour == Colour.BLUE:
#         print(f'You bought a cool blue {brand}.')
#     else:
#         print('Unknown color.')

# # Main entry point
# def main() -> None:
#     buy_car('BMW', Colour.BLUE)     #Output: You bought a cool blue BMW
#     buy_car('Volvo', Colour.RED)    #Output: You bought a smoking hot red Volvo
#     buy_car('Toyota', Colour.GREEN) #Output: You bought an eco-friendly green Toyota

# if __name__ == '__main__':
#     main()

#---------------------------------------------------------------------------------------------

