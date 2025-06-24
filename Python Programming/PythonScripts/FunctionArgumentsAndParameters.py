#FUNCTION ARGUMENTS AND PARAMETERS

#EXAMPLE: A FUNCTION WITH PARAMETERS:
# Each ARGUMENT provides a VALUE to a PARAMETER
def add(x, y): #PARAMETERS
    result = x + y
    print(result)


add(2, 3)  #ARGUMENTS #OUTPUT =5

#EXAMPLE: A FUNCTION WITHOUT PARAMETERS:
# A function with no parameters
def say_hello():
    print("Hello!")

say_hello("Bob")  #Error: this function doesn’t take any arguments


# A function with one parameter
def say_hello(name):
    print(f"Hello, {name}!")

say_hello("Bob")  # Works, gives "Bob" as the argument
say_hello()       # Error: missing an argument


#EXAMPLE: KEYWORD ARGUMENTS

def say_hello(name):
    print(f"Hello, {name}!")


say_hello(name="Bob") #OUTPUT= Hello, Bob! (SHOWS WHICH ARGUMENT IS FOR WHICH PARAMETER)


def divide(dividend, divisor):
    if divisor != 0:
        print(dividend / divisor)
    else:
        print("You fool!")


divide(dividend=15, divisor=3) # OUTPUT = 5.0
divide(15, 0) # OUTPUT = You fool!
divide(15, divisor=0)   # OUTPUT = You fool!
# divide(dividend=15, 0)  #Named ARGUMENTS  go AFTER positional arguments