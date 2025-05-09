# FILE HANDLING (SECTION 18)
#-----------------------------------------------------------------------------

#INTRODUCTION
# from typing import TextIO

# # Define file path
# file_path: str = 'info.txt'

# # Create a sample file
# with open(file_path, 'w') as f:
#     f.write('This is some info.\nHi Bob.')

# # Traditional way of opening files
# try:
#     file: TextIO = open(file_path, 'r')
#     text: str = file.read()
#     print(text)
#     file.close()
# except FileNotFoundError:
#     print('Could not find the file.')
# except Exception as e:
#     print(f'Error: {e}')
# finally:
#     if not file.closed:
#         file.close()
#         print('File closed forcefully.')

# # Using with statement (modern way)
# try:
#     with open(file_path, 'r') as f:
#         text: str = f.read()
#         print(text)
# except FileNotFoundError:
#     print(f'No file found at {file_path}')

#-----------------------------------------------------------------------------
# READING

# File Reading Modes

# Reading a file in read (r) mode - default mode
# with open('info.txt', 'r') as f:
#     text = f.read()
#     print(text)

# # Demonstrating that reading is exhaustive
# with open('info.txt', 'r') as f:
#     print(f.read())  # First read
#     print(f.read())  # Second read - will be empty

# # Reading specific number of bytes
# with open('info.txt', 'r') as f:
#     print(f.read(5))  # Reads first 5 bytes Example: This i
#     print(f.read(5))  # Reads next 5 bytes
#     print(f.read())   # Reads the rest

# # Using readline() to read one line at a time
# with open('info.txt', 'r') as f:
#     print(f.readline(), end='')
#     print(f.readline(), end='')

# # Using readlines() to read all lines as a list
# with open('info.txt', 'r') as f:
#     lines = f.readlines()
#     print(lines)
#-----------------------------------------------------------------------------
# APPEND

# Appending Text to a File

# file_path: str ='info.txt'

# # Opening the file in append (a) mode
# with open(file_path, 'a') as text:
#     text.write('I am some text.\n')

# # Writing multiple lines using writelines()
# with open('info.txt', 'a') as f:
#     text.writelines(['eggs\n', 'ham\n', 'spam\n'])

# # Demonstrating automatic file creation in append mode
# with open('test.txt', 'a') as f:
#     text.write('This is a newly created file with append mode.\n')

#-----------------------------------------------------------------------------
# WRITING
# Writing Text to a File

# # Writing data to 'info.txt' using write ('w') mode
# with open('info.txt', 'w') as txt:
#     txt.write('Hello\n')
#     txt.write('Bob\n')

# # Demonstrating that write mode wipes existing content
# with open('info.txt', 'w') as txt:
#     txt.write('This is a completely new text file.\n')
#     txt.write('All previous data has been erased.\n')

#-----------------------------------------------------------------------------
# JSON   
# Working with JSON in Python

# import json

# # Reading JSON from a file
# file_path = 'data.json'

# with open(file_path, 'r') as file:
#     data: dict = json.load(file)

# print(data) #Output: {'name': 'Mario', 'age': 33, 'friends': ['Luigi', 'Toad'], 'other_info': None}

# # Reading JSON from a string
# my_json: str ='''
# {
#     "name": "Alice",
#     "age": 30,
#     "job": null
# }
# '''

# data:  dict = json.loads(my_json)
# print(data) #Output in fomr of python dictionary: {'name': 'Alice', 'age': 30, 'job': None}


# # Creating JSON data (dictionary) in Python
# data: dict = {
#     "name": "Bob",
#     "age": 43,
#     "job": None
# }

# # Writing JSON to a new file
# with open('new_json.json', 'w') as file:
#     json.dump(data, file)

# print('\nData written to new_json.json')

# # Converting JSON data to a string format
# json_format: str = json.dumps(data)
# print('\nJSON String Format:', json_format)


#-----------------------------------------------------------------------------