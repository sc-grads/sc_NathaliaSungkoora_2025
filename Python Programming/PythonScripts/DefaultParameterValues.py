# DEFAULT PARAMETER VALUES

def add(x, y=3): #x is a required parameter and y is an optional parameter
    print(x + y)


add(5)  # OUTPUT= 8 (Uses default value of 3 and adds that to x-value defined as 5)
add(5, 8)  #  # OUTPUT= 13
add(y=3)  # Error, missing x (which is REQUIRED)

#NOTE: DEFAULT PARAMETERS MUST GO AT END (cannot be for example, (x=5, y))


#Default Parameter Values in Functions
default_y = 3  # Set default value

# y uses the value of default_y when the function is defined
def add(x, y=default_y):
    total = x + y
    print(total)

add(2)  # OUTPUT= 5 (uses default y = 3)

default_y = 10  # Changing default_y now won't change the function's default
add(2)  # OUTPUT Still =5
