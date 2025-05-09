#BUILT IN FUNCTIONS (SECTION 12)

#-----------------------------------------------------------------
# CALLABLE (callable())
# It allows us to check whether an object is callable or not.

# # Example variables
# fruit: str = 'apple'
# number: int = 10

# # A simple function definition
# def func() -> None:
#     print('func() was called!')

# # Checking if objects are callable
# print(f'callable(): {callable(fruit)}')  # Output: callable():False


# print(f'callable(): {callable(number)}')  # Output: callable(): False
# print(f'callable(): {callable(func)}')  # Output: callable():True

# # Built-in callable types
# print(f'callable(): {callable(range)}')  # Output: callable():True
# print(f'callable(): {callable(str)}')    # Output: callable():True

# # Using callable in a condition
# if callable(func):
#     func()
# else:
#     print('The object is not callable.')


#-----------------------------------------------------------------
# FILTER (filter())


# # List of numbers from 1 to 20
# numbers: list[int] = list(range(1, 21))
# print(numbers)
#     #Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

# # Using filter with a named function
# def is_even(number: int) -> bool:
#     return number % 2 == 0

# # Filtering even numbers with the named function
# even_numbers: filter = filter(is_even, numbers)
# print(list(even_numbers)) #Output: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

# print(f'Even numbers (named function): {even_numbers}')  # Output: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
#-----------------------------------------------------

# numbers: list[int] = list(range(1, 21))
# print(numbers)
# # Using filter with a lambda function
# even_numbers: filter = filter(lambda n: n % 2 == 0, numbers)
# print(list(even_numbers)) #Output: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]


# # ANOTHER EXAMPLE USING STRINGS:
# # List of names
# people: list[str] = ['Anna', 'Bob', 'Betty', 'James', 'John']

# # Filtering long names (length > 4) with a lambda (better for longer lists)
# long_names: filter = filter(lambda name: len(name) > 4, people)
# print(list(long_names))  # Output: ['Betty', 'James']

# # List comprehension alternative
# ln: list[str] = [name for name in people if len(name) > 4]
# print(ln)  # Output: ['Betty', 'James']


#-----------------------------------------------------------------
# MAP (map())


# List of integers
# numbers: list[int] = [1, 2, 3, 4, 5]

# # Function to double a number
# def double(number: int) -> int:
#     return number * 2

# # Using map with a defined function
# doubled: map = map(double, numbers)
# print(doubled) # output: <map object at 0x0000020F82B9B0A0>
# print(list(doubled))  # Output: [2, 4, 6, 8, 10]


# #Usually don't pass in a function, use lambda instead:
# # Using map with a lambda function
# doubled: map = map(lambda n: n * 2, numbers)
# print(doubled) # output: <map object at 0x0000020F82B9B0A0>
# print(list(doubled))  # Output: [2, 4, 6, 8, 10]


#---------------------
#Modern version:

# List of integers
# numbers: list[int] = [1, 2, 3, 4, 5]

# #Function to double a number
# def double(number: int) -> int:
#      return number * 2

# # Using list comprehension (modern approach)
# doubled: list[int]= [double(n) for n in numbers] # or = [n * 2 for n in numbers] 
# print(doubled)  # Output: [2, 4, 6, 8, 10]

#------------------
# More complex example: Combining two lists
# numbers: list[int] = [1, 2, 3, 4, 5]
# letters: list[str] =  ['A', 'B', 'C']

# # Combining using map
# def combine_elements(numbers: int, letters: str) -> tuple[int, str]:
#     return numbers, letters 

# combined: map= map(combine_elements,numbers, letters)
# print(list(combined)) # Output: [(1, 'A'), (2, 'B'), (3, 'C')]


# # Combining using map and lambda
# combined: map= map(lambda numbers, letters: (numbers, letters), numbers, letters)
# print(list(combined)) # Output: [(1, 'A'), (2, 'B'), (3, 'C')]



#-----------------------------------------------------------------
# SORTED (sorted())
# List of integers
# numbers: list[int] = [1, 10, 5, 3]
# sorted_numbers: list[int] = sorted(numbers)
# print(sorted) # Output: [1,3,5,10]

# # List of strings
# people: list[str] = ['Anna', 'Mario', 'James', 'Tom']
# sorted_names: list[str] = sorted(people)
# print(sorted_names)  # Output: ['Anna', 'James', 'Mario', 'Tom']

# # Sorting with reverse order
# sorted_names_reverse: list[str] = sorted(people, reverse=True)
# print(sorted_names)  # Output: ['Tom', 'Mario', 'James', 'Anna']

# # Sorting by length
# sorted_by_length: list[str] = sorted(people, key=lambda x: len(x))
# print(sorted_names)  # Output: ['Tom', 'Anna', 'Mario', 'James']

# #-------------------------
# # Sorting with a class
# class Animal:
#     def __init__(self, name: str, weight: int):
#         self.name = name
#         self.weight = weight

#     def __repr__(self):
#         return f'{self.name} ({self.weight}kg)'

# cat = Animal('Cat', 10)
# dog = Animal('Dog', 5)
# kangaroo = Animal('Kangaroo', 30)

# animals = [cat, dog, kangaroo]
# sorted_animals = sorted(animals, key=lambda animal: animal.weight)
# print(sorted_animals)  # Output: [Dog (5kg), Cat (10kg), Kangaroo (30kg)]


#----------------------------------------------------------------------------------------

# EVAL (eval())

# Using eval with a simple expression
# result: int = eval('1 + 10 + 100')
# print(result)  # Output: 111

# # Using eval with variables
# x: int = 5
# y: int = 10
# result_vars: int = eval('x + y')
# print(result_vars)  

# # Building a simple calculator using eval

# while True:
#     user_input: str = input("Enter math: ")
#     print(eval(user_input)) # Output: 10+10=20

# Security Warning
# Eval can be dangerous if user input is not trusted.
# Never use eval with untrusted input in a real application.


#----------------------------------------------------------------------------------------

# EXEC (exec ())
# Allows whole scripts to be executed
# ONLY EXECUTES CODE!

# Using exec with multi-line code
# code = '''
# x = 5
# y = 10
# z = x + y
# print('Hello World!')
# for i in range(3):
#     print(i)
# '''

# # Executing the multi-line code
# exec(code)

# # Simple command execution using exec

# while True:
#     user_input: str = input(" Command: ")
#     exec(user_input)
   

# Security Warning
# Exec can be dangerous if user input is not trusted.
# Never use exec with untrusted input in a real application.

#----------------------------------------------------------------------------------------

# ZIP (zip ())

# Creating three lists
# numbers: list[int] = [1, 2, 3, 4]
# letters: list[str] = ['A', 'B', 'C', 'D']
# symbols: list[str] =['!', '@', '#']

# # Using zip to combine numbers and letters
# zipped: zip = zip(numbers, letters)
# print(zipped) #Output: <zip object at 0x000001C1A07B3E40>
# print(list(zipped)) #output: [(1, 'A'), (2, 'B'), (3, 'C'), (4, 'D')]



# # Looping through the zipped object
# for n, l in zipped:
#     print(n, l, sep=': ') # Output: 1: A 2: B 3: C 4: D  

#    # Demonstrating zip with different lengths (numbers and symbols)
# zipped_symbols = zip(numbers, symbols)
# print( list(zipped_symbols))  # Output: [(1, '!'), (2, '@'), (3, '#')]

# # Using strict mode (only works in Python 3.10+)

# zipped_strict = zip(numbers, symbols, strict=True)
# print(list(zipped_strict))

# # Zipping all three lists together
# zipped_all: zip = zip(numbers, symbols, letters)
# print(list(zipped_all))  # Output: [(1, '!', 'A'), (2, '@', 'B'), (3, '#', 'C')]
 

#----------------------------------------------------------------------------------------
