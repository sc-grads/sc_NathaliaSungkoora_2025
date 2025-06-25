# FIRST CLASS FUNCTIONS

# FIRST CLASS FUNCTION means that functions can be passed as arguments to other functions.

def divide(dividend, divisor):
    # Raise an error if trying to divide by 0
    if divisor == 0:
        raise ZeroDivisionError("Divisor cannot be 0.")

    # Return the result of division
    return dividend / divisor

def calculate(*values, operator):
    # 'operator' is a function passed as an argument (like divide)
    return operator(*values)

# Pass 'divide' function as argument to 'calculate'
result = calculate(20, 4, operator=divide)
print(result)  # OUTPUT = 5.0

# This will raise a ZeroDivisionError because divisor is 0
result = calculate(20, 0, operator=divide)
print(result)  # OUTPUT = ZeroDivisionError: Divisor cannot be 0.

#DEFINING A SEARCH() FUNCTION

def search(sequence, expected, finder):
    for elem in sequence:
        if finder(elem) == expected:
            return elem
    raise RuntimeError(f"Could not find an element with {expected}")


#HAVE A LIST OF FRIENDS: want to find Bob Smith
friends = [
    {"name": "Rolf Smith", "age": 24},
    {"name": "Adam Wool", "age": 30},
    {"name": "Anne Pun", "age": 27},
]

def get_friend_name(friend):
    return friend["name"]


(search(friends, "Bob Smith", get_friend_name))
#OUTPUT = RuntimeError: Could not find an element with Bob Smith
print(search(friends, "Rolf Smith", get_friend_name))
#OUTPUT = {'name': 'Rolf Smith', 'age': 24}

#CAN ALSO USE LAMBDA
print(search(friends, "Bob Smith", lambda friend: friend["name"]))
#OUTPUT = RuntimeError: Could not find an element with Bob Smith



#EXAMPLE USING BUILT-IN FUNCTIONS
from operator import itemgetter
## itemgetter creates a function that gets a specific key from a dictionary


def search(sequence, expected, finder):
    for elem in sequence:
        if finder(elem) == expected:
            return elem
    raise RuntimeError(f"Could not find an element with {expected}")


friends = [
    {"name": "Rolf Smith", "age": 24},
    {"name": "Adam Wool", "age": 30},
    {"name": "Anne Pun", "age": 27},
]

# Call search to find the friend whose 'name' is "Rolf Smith" using itemgetter to get the 'name' key
print(search(friends, "Rolf Smith", itemgetter("name")))
#OUTPUT = {'name': 'Rolf Smith', 'age': 24}

