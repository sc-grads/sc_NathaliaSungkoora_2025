print ("Hello World")

#Checking data type of variables
x =str(3)
y =int(3)
z =float(3)

print(x)
print(y)
print(z)

print(type(x))
print(type(y))
print(type(z))

#Assign Multiple Values to Variables
x, y, z = "Apple", "Orange", "Banana"
print(x)
print(y)
print(z)

x = y = z ="Orange"
print(x)
print(y)
print(z)

# Unpacking a collection
fruits = ["Strawberry", "Pear", "Cherry"]
x, y, z = fruits

print(x)
print(y)
print(z)

# Output Multiple Varaiables
x = "Learning is fun with Python!"
print(x)

x = "Python"
y = "is"
z = "Awesome!"

print(x, y, z) # seperate them with commas


x = "Python "
y = "is "
z = "Awesome!"

print(x + y + z) # seperate them with addition (make sure spaces are in words)


x = 5
y = "Star"

print(x, y) # Adding a number and a string together


# Global Variables
x = "awesome" #created outside the function and can be used anywhere in the code
def myfunc():
    print("Python is " + x)

myfunc()

# creating  a variable inside the function
x = "awesome" #created outside the function and can be used anywhere in the code
def myfunc():
    x = "fantastic"
    print("Python is " + x)

myfunc()

print("Python is " + x)



def myfunc():
    global x #ensuring variable is global and not local
            # allows you to create this inside a function
    x = "fantastic"

myfunc()

print("Python is " + x)

#Another example of global functions
x = "awesome" 
print("Python is " + x)
def myfunc():
    global x 
    x = "fantastic"

myfunc()
print("Python is " + x)

