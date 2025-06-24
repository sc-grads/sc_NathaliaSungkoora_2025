# UNPACKING ARGUMENTS

def multiply(*args):
    print(args)


multiply(1, 3, 5) #Arguments are collected and added to variable
#OUTPUT= (1, 3, 5) written as a tuple

#Multiplying by each argument
# This function multiplies all the numbers you give it
def multiply(*args):
    print(args)  # Shows the arguments as a tuple

    total = 1  # Start with 1 (because we're multiplying)
    for arg in args:  # Goes through each number
        total = total * arg  # Multiply them together

    return total  # Give back the final answer

print(multiply(1, 3, 5))  # OUTPUT = 15

#######
#Example of Unpacking


def add(x, y):
    return x + y

nums = [3, 5]
print(*nums) #OUTPUT = 3 5 (unpacks the list into separate values)
print(add(*nums))  # OUTPUT: 8
#LOGIC of what is happening:
# nums is a list with two numbers [3, 5]
# *nums takes the numbers out and passes them to add() one by one like add(3, 5)
# add() adds them and returns 8
# print() shows the result 8
#######

#EXAMPLE: Passing Dictionary Values to a Function in Python
def add(x, y):
    return x + y # Add x and y and give the result

nums = {"x": 15, "y": 25}  # A dictionary with two numbers
#Takes numbers from the dictionary and send them to add function as x and y
print(add(x=nums["x"], y=nums["y"])) #OUTPUT = 40 (15 + 25)
# This line does the same but sends the whole dictionary at once
print(add(**nums)) #OUTPUT = 40 (15 + 25)

#Another example

def multiply(*args):
    total = 1
    for arg in args:
        total = total * arg

    return total


def apply(*args, operator):
    if operator == "*":
        return multiply(args)
    elif operator == "+":
        return sum(args)
    else:
        return "No valid operator provided to apply()."

#Passing in arguments to be collected in args
#Operator=named argument (MUST be passed in) for example: operator="+"
print(apply(1, 3, 6, 7, operator="+")) #OUTPUT= 17 (added all numbers together)
print(apply(1, 3, 6, 7, operator="*")) #OUTPUT= (1, 3, 6, 7) returned as a tuple

#Modifying Code to include values as separate and not a tuple
#add *args

def multiply(*args):
    total = 1
    for arg in args:
        total = total * arg

    return total


def apply(*args, operator):
    if operator == "*":
        return multiply(*args) #passing in four different arguments not tuple as a whole
    elif operator == "+":
        return sum(args)
    else:
        return "No valid operator provided to apply()."

#Passing in arguments to be collected in args
#Operator=named argument (MUST be passed in) for example: operator="+"
print(apply(1, 3, 6, 7, operator="*")) #Output = 126