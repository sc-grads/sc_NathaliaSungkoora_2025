#PRINT FUNCTION (SECTION 11)

#-----------------------------------------------------------------
# PRINT (print())
# Understanding the Print Statement in Python (with Simple Comments)

# Understanding the Print Statement in Python (with Simple Comments)

# # Print a simple string
# print('Hello, Bob')

# # Print multiple values (default separator is space)
# print(1, 2, True, ['a', 'b'])

# # Use 'sep' to set a custom separator
# print('A', 'B', 'C', sep='-')  # Output: A-B-C

# # Another example with a complex separator
# print('A', 'B', 'C', sep=' . ')  # Output: A . B . C

# # Use 'end' to set what comes at the end
# print('Hello', end='!!!\n')  # Output: Hello!!!

# # Remove newline with 'end'
# print('Hello', end='')
# print('Bob')  # Output: HelloBob

# # Use 'sep' and 'end' together
# print('A', 'B', 'C', sep=', ', end='.')  # Output: A, B, C.

# # Unpack list elements with * (each element separately)
# people = ['Alice', 'Bob', 'Charlie']

# # Print list as a single element
# print(people)

# # Print list elements separately
# print(*people, sep=', ', end='.')  # Output: Alice, Bob, Charlie.


#-----------------------------------------------------------------
# ENUMERATE (enumerate())

# Understanding Enumerate in Python (with Simple Comments)

# Understanding Enumerate in Python (with Simple Comments)

# List of elements
# elements: list[str]=['A', 'B', 'C']

# # Using enumerate to create an enumeration object
# enumeration:enumerate = enumerate(elements)


# #Testing:
# # Converting the enumerate object to a list to see the pairs
# #print(list(enumeration))  # Output: [(0, 'A'), (1, 'B'), (2, 'C')]
# # Starting enumeration from 1 instead of 0
# #enumeration = enumerate(elements, start=1)
# #print(list(enumeration))  # Output: [(1, 'A'), (2, 'B'), (3, 'C')]
# #Testing End:

# #Creating a for loop
# # Using enumerate directly in a for loop #OPTION1
# #for i, element in enumerate(elements):
#     #print(f'{i}: {element}')  # Output: 0:A, 1:B, 2:C

# # Using enumerate with a custom start in a for loop #OPTION1
# for i, element in enumerate(elements, start=1):
#     print(f'{i}: {element}')   # Output: 1:A, 2:B, 3:C

#-----------------------------------------------------------------
# ROUND (round())


# List of float values
# a: float = 200.3123399
# b: float = 18.12132
# c: float = 47.12312

# # Adding the float values
# result: float = a + b + c
# print(result)  # Output: 265.55677990000004

# # Rounding to 1 decimal place
# print(round(result, 1))  # Output: 265.6

# # Rounding to 0 decimal places (nearest whole number)
# print(round(result, 0))  # Output: 266.0

# # Rounding with negative values (rounding whole numbers)
# print(round(result, -1))  # Output: 270.0
# print(round(result, -2))  # Output: 300.0

#-----------------------------------------------------------------
# RANGE (range())

# Creating a range from 1 to 5
# my_range: range= range(1, 6)
# print(my_range)  # Output: range(1, 6) - A range object

# # Converting range to a list for better visibility
# print(list(my_range))  # Output: [1, 2, 3, 4, 5]

# # Creating a range from 1 to 100
# my_range = range(1, 101)
# print(my_range)  # Output: range(1, 101)
# print(list(my_range))  # Output: List of numbers from 1 to 100

# # Creating a range without specifying a start value (starts at 0)
# my_range = range(5)
# print(list(my_range))  # Output: [0, 1, 2, 3, 4]

# # Creating a range with a custom step value
# my_range = range(0, 10, 2)
# print(list(my_range))  # Output: [0, 2, 4, 6, 8]

# # Creating a range that counts down
# my_range = range(0, -5, -1)
# print(list(my_range))  # Output: [0, -1, -2, -3, -4]

# # Using range in a for loop
# for i in range(3):
#     print(i)  # Output: 0, 1, 2


#-----------------------------------------------------------------
# SLICE (slice())    

# # String to demonstrate slicing
# text: str = 'Hello World'

# # Creating a slice object to get the first three characters
# first_three: slice = slice(0, 3)
# print(text[first_three])  # Output: Hel

# # Creating a slice object to reverse the text
# reverse_slice: slice = slice(None, None, -1) #same as []::-1]
# print(text[reverse_slice])  # Output: dlroW olleH

# # Creating a slice object to step by 2
# step_two: slice = slice(None, None, 2)
# print(text[step_two])  # Output: HloWrd: Every second character

# # Demonstrating reusability with another string
# second_text: str = 'Python Programming'
# print('second_text'[first_three])  # Output: First three characters
# print('second_text'[reverse_slice])  # Output: Reversed text
# print('second_text'[step_two])  # Output: Every second character

#-----------------------------------------------------------------
# GLOBAL (global())

# # Importing Any from typing
# from typing import Any

# # Printing all global variables (will be a dictionary)
# print(globals())  # Output: Dictionary of global variables

# # Defining variables in the global scope
# text: str = 'Bob'
# my_list: list[int] = [1, 2, 3]

# def function() -> None:
#     pass

# # Printing globals again to see the new variables
# print(globals())  # Output: Updated dictionary with text, my_list, and my_function

# # Creating a readable format of globals
# my_globals: dict[str, Any] = dict(globals())

# # Printing each global variable in a readable format
# for k, v in my_globals.items(): #print as a key value pair
#     print(f'{k}: {v}')

#---------------------------------------------------
#LOCALS 

# # Adding a global variable for demonstration
# EXAMPLE: str = "Bob"
# # Defining a function to demonstrate locals
# def add(a: int, b: int) -> None:
#     # Local variable inside the function
#     result: int = a + b



#     # Printing the result
#     print(f' {a} + {b} = {result}')

#     # Printing the local variables within the function
#     print('add() has:', locals())
#     print('add() can see:', globals())   
#     print(EXAMPLE)
# # Calling the add function
# add(1, 1)
# #Output:  1 + 1 = 2
#             #add() has: {'a': 1, 'b': 1, 'result': 2}

#---------------------------------------------------
# ALL (all())

# # Boolean variables (example values)
# wifi_enabled: bool = True
# has_electricity: bool =True
# has_subscription: bool =True

# # Using all() to check connectivity
# if wifi_enabled and has_subscription and has_electricity:
#     print('Connected to the internet')
#     #Output: Connected to the internet(for all conditions)

# # Better written code:
# requirements: list[bool] = [wifi_enabled,has_electricity, has_subscription]
# if all(requirements):
#      print('Connected to the internet') 
#    #Same Output(less code): Connected to the internet(for all conditions)


# # Voting example
# people_voted = [1, 1, 0, 1]  # 1 = voted, 0 = not voted

# # Function to check voting status

# if all(people_voted): #Opposite: if not all(people_voted
#      print('Everyone voted')
# else:
#     print('Some people did not vote')
# #output: Some people did not vote


#---------------------------------------------------
# ANY (any())
#Checks if one element ina a list is at least true to pass a check


# # Example Usage
# people_voted = [0, 1, 0, 0, 0]  # 1 = voted, 0 = not voted

# # Function to check if any person voted

#     # Check if at least one person voted
# if any(people_voted): #or write list here : if any([1,1,1,1])
#     print('At least one person voted')
# else:
#     print('No one voted')

# #output: At least one person voted
#---------------------------------------------------
# IS INSTANCE ( isinstance())
#Used specifically to check data types
#Checks if object is an instance of another object or sub-class of another object.

# # Example variables
# num: int = 42
# pi: float = 3.14
# text: str = 'Hello World'
# my_list: list[int] = [1, 2, 3]

# # Checking data types using isinstance
# print(isinstance(num, int))  # Output: True
# print(isinstance(num, str))  # Output: False
# print(isinstance(num, float))  # Output: False

# print(isinstance(pi, float))  # Output: True
# print(isinstance(pi, int))  # Output: False

# #Union to check if pi is integer or float
# print(isinstance(pi, int | float))  # Output: True

# print(isinstance(text, str))  # Output: True

# print(isinstance(my_list, list))  # Output: True
# print(isinstance(my_list, tuple))  # Output: False
# #-------------
# # Class and Subclass Example
# class Animal:
#     pass

# class Cat(Animal):
#     pass

# # Checking subclass relationships
# print(isinstance(Cat(), Animal))  # Output: True
# print(isinstance(Animal(), Cat))  # Output: False (animal not subclass of cat)

#---------------------------------------------------


