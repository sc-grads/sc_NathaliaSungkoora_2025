# FUNCTIONS IN PYTHON

# EXAMPLE: Defining a function named 'hello'
def hello():
    print("Hello!")

# Calling the function by using its name with parentheses
hello()  # OUTPUT: Hello!

#Another example:
#PART1: What the code does
def user_age_in_seconds():  # Defining the function
    user_age = int(input("Enter your age: "))
    age_seconds = user_age * 365 * 24 * 60 * 60
    print(f"Your age in seconds is {age_seconds}.")
#PART2: Running the code
user_age_in_seconds()  # Calling the function to run it
                    #OUTPUT(after age is entered e.g. 30): Your age in seconds is 946080000.


#Same example: Running code sequentially (line by line):
def user_age_in_seconds():
    user_age = int(input("Enter your age: "))
    age_seconds = user_age * 365 * 24 * 60 * 60
    print(f"Your age in seconds is {age_seconds}.")


print("Welcome to the age in seconds program!")
user_age_in_seconds()

print("Goodbye!")

#DO NOT:.....
#Do not reuse VARIABLE NAMES:
friends = ["Rolf", "Bob"]


def add_friend():
    friend_name = input("Enter your friend name: ")
    friends = friends + [friend_name]  # Another way of adding to a list!


add_friend()
print(friends)  # Always ['Rolf', 'Bob']


#Can't  call function before it is defined:
say_hello()


def say_hello():
    print("Hello!")
#DO NOT.....


#Always add GLOBAL variables at the top to know what is going on

#one way that works:
def add_friend():
    friends.append("Rolf")


friends = []
add_friend()

print(friends)  #OUTPUT:[Rolf]


#add global variable to the top:
friends = []
def add_friend():
    friends.append("Rolf")

add_friend() #can run multiple times to append list multiple times
                #Example: ['Rolf', 'Rolf' , 'Rolf']


print(friends)  #OUTPUT: [Rolf]



#FUNCTIONS CODING EXERCISE:
# Complete the function by making sure it returns 42. .
def return_42():
   return 42

# Create a function below, called my_function, that takes two arguments and returns the result of its two arguments multiplied together.
def my_function(x,y):
    return (x*y)