#SECTION: 5 ERRORS

#User Input

#import sys
#total: int = 0
#while True:
    #user_input: str = input('Enter a number: ')

    #if user_input == '0': #Exit program as soon as '0' is entered
        #print('Total:', total)
        #sys.exit()

    #total += int   (user_input) 
#--------------------------------------------------------------------
#Shortcut(Rename)

#def get_stats(f_name: str)-> None:
    #print(f'{f_name} is a good name!')
    #print(f'{f_name} is {len(f_name)} characters long.')
    #print(f'{f_name} in uppercase is {f_name.upper()}')

#get_stats('James')

#--------------------------------------------------------------------
#Try/Except

#  Basic Try-Except Block
#try:
    #result: float = 10/0
   ##except Exception as e: #Catches error in the code to avoid crashes
   # print(f'Error: {e}')


# Handling Specific Exceptions
#while True:
    #try:
        #user_input: str = input('Enter a number: ')
        #print(f'10/{user_input} = {10 / float(user_input)}')
    #except ZeroDivisionError:
        #print ('You cannot divide by 0')
   # except ValueError:
        #print ('Please enter a valid number...')        
    #except Exception as e:
        #print(f'Something else went wrong: {e}')

# Advanced Exception Handling with a Calculator
#import sys

#total: float = 0
#while True:
    #user_input = input("Enter a number: ")

    #if user_input == "0":
        #print(f"Total: {total}")
        #sys.exit()

    #try:
       # total += float(user_input)
    #except ValueError:
       # print("Please enter a valid number.") 

# Using Else and Finally with try-except
#user_input: str  = "10"  

#try:
    # Trying a potentially dangerous operation
    #result: float = 1 / float(user_input)
    #print(f"1 /{user_input} = {result}")

# Handling specific exceptions
#except ValueError:
    #print(f"You cannot use '{user_input}' as a value.")
#except ZeroDivisionError:
    #print("Don't be silly. You cannot divide by zero.")

# Else block - executes only if no exception is raised
#else:
   # print("Success! There were no exceptions encountered.")

# Finally block - always executes regardless of exception
#finally:
    #print("FINALLY: I am always executed.")  
#--------------------------------------------------------------

#Raise
#Manually Raising Exceptions with 'raise'

# Function to check age with manual exception raising
#def check_age(age: int) -> bool:
    #if age < 0:
        #raise ValueError('Not a valid age...') #syntax (raise, error, message)
    #elif age >= 21:
        #print('You are old enough.')
        #return True
    #else:
       # print('You are not old enough.')
       # return False
#check_age(10) #Output: You are not old enough.
#check_age(50) #Output: You are old enough.

# Testing the function
#try:
    #print(check_age(30))  # Expected: True, You are old enough.
    #print(check_age(10))  # Expected: False, You are not old enough.
    #print(check_age(-10)) # Expected: ValueError: Not a valid age...
#except ValueError as e:
    #print(f'Error: {e}')

# Example of raising a general exception (not recommended)
#try:
   # raise Exception('This is a general exception.')
#except Exception as e:
    #print(f'General Exception: {e}')

#--------------------------------------------------------
#Unknown Errors
# Example:

#while True:
    #user_input: str = input('Enter a number: ')

    #try:
        # Attempting to convert input to float
        #number: float = float(user_input)
        #print(f'You entered: {number}')

    # General exception handler for unexpected errors
    #except Exception as e:
        #print('Program encountered a new exception!')
        #print(f'Type: {type(e)}')
       # print(f'Error: {e}')

# Improving by handling specific known exception (added after try)
    #except ValueError:
        #print(f'The value you entered '{user_input}' is invalid.')