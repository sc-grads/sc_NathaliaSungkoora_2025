# UNPACKING KEYWORD ARGUMENTS

#UNPACKING **KWARGS
def named(**kwargs):
    print(kwargs)

named(name="Bob", age=25)
#OUTPUT(dictionary is printed) = {'name': 'Bob', 'age': 25}

# Example 1:
def named(name, age):
    print(name, age)

details = {"name": "Bob", "age": 25}
named(**details)  # Output: Bob 25

#Example2:
def named(**kwargs):
    print(kwargs)

details = {"name": "Bob", "age": 25}
named(**details)  # Unpacks the dictionary and passes it into kwargs
                    # Output: {'name': 'Bob', 'age': 25}


#####

#Using **kwargs to Pass and Print Multiple Keyword Arguments
def named(**kwargs):
    print(kwargs) #OUTPUT= {'name': 'Bob', 'age': 25}


def print_nicely(**kwargs):
    named(**kwargs)  # Unpack the dictionary into keyword arguments.
    for arg, value in kwargs.items():
        print(f"{arg}: {value}")

print_nicely(name="Bob", age=25) #OUTPUT= name: Bob| age: 25

#####

#Using *args and **kwargs Together in a Function
def both(*args, **kwargs):
    print(args) #OUTPUT = (1, 3, 5)
    print(kwargs) #OUTPUT = {'name': 'Bob', 'age': 25
both (1, 3, 5, name="Bob", age=25)


#ERRORS WHEN UNPACKING:
def myfunction(**kwargs):
    print(kwargs)


myfunction(**"Bob")  # Error, must be mapping
myfunction(**None)  # Error