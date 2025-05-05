#print("Hello Nathalia") #Greets user
#print("Hello Bob")


#Check this out
#Print a friendly message to the user
#print("Ciao Bello!")


#Creating variable name
#greeting='Hello'

#Original greeting without variable
#print('Hello ' +  'Bob!')
#print('Hello ' +  'Cat!')
#print('Hello ' +  'Dave!')


#Greeting with variable
#print(greeting  +  ' Bob!')
#print(greeting +  ' Cat!')
#print(greeting  +  ' Dave!')

#CONSTANTS

#PI=3.1415
#VERSION=2

#print(VERSION)
#print(PI*2)

#PI=4
#print(PI)


#DATA TYPES
#print(5+ 'Hello')

#print(5+ 10.5)


# COMMON TYPES IN PYTHON:

# int = whole numbers
#x = 5  # Example of int

# float = decimal numbers
#y = 5.5  # Example of float


#number=10
#print(number)

#percent=1.5
#print (percent) 
#print (type(percent))

#imaginary=9J
#print(imaginary)

# BOOLEAN = True or False

#is_valid = True  # Example of bool
#is_connected = True 
#has_money=False

# str = text
#message = "hello"  # Example of str

#SEQUENCE TYPES
# list = changeable group of values
#numbers = [1, 2, 3]  # Example of list (can edit it)

# tuple = fixed group of values
#coordinates = (1.0, 2.5)  # Example of tuple


#MAPPING TYPES
# dictionary = key-value pairs
#users = {'Mario': 1, 'Luigi': 2}  # Example of dict


#SET TYPES
# set = unordered, unique values
#raffle = {1, 10, 25, 50}  # Example of set
#frozen =frozenset({1, 2, 3} )  # Example of a frozen set (cannot be modified)


#TYPE HINTS
#number=10 #number
#print (number) 
#print (type(number))

#number='Hello' #string
#print (number) 
#print (type(number))

#Defining type hints of data 
#number: int=10 #number
#print (number)

#text: str='Hello' #string
#print (text)

#text: str='Hello' #string
#print (text + '!')

#INTEGERS

#age: int= 35
#money: int= 100
#self_esteem: int=-50

#a: int=5
#b: int=10

#print(a+b) #Addition
#print(a-b) #Subtraction
#print(a*b) #Multiplication
#print(a/b) #Division

#FLOAT

#PI: float=3.1415
#percent: float=0.5
#height_in_metres: float=1.72

#a: float = 5
#b: float = 1.5

#print(a + b)  # Addition
#print(a - b)  # Subtraction
#print(a * b)  # Multiplication
#print(a / b)  # Division

#Can turn integer into a float but can't easily turn float into an integer without rounding the number up or down
#number: float=10
#number2: int= 1.0



#OPERATORS
#a: int = 2
#b: int = 4

#FLOOR DIVISION OPERATOR (//): it returns the whole number part only
#print(a//b) #Output=0
#print(4//3) #Output=1 (Example)

#EXPONENTIAL OPERATOR(**): raises one number to the power of another
#print(a**b) #Output=16

#MODULUS(%): gives the remainder — shows what’s left after division
#print(a % b) #Output=2
#print(3 % 2) #Output=1
#print(10 % 7) #Output=3

#print(10 + 10 *2) #Output=30
#print((10 + 10) *2) #Output=40

#x: int=2
#x+=2 #Same as x= x+2 but with less code
#print(x)

#x-=2 #Same as x= x-2 but with less code
#print(x)

#x/=2 #Same as x= x/2 but with less code
#print(x)

#x*=2 #Same as x= x*2 but with less code
#print(x)

#x%=2 #Same as x= x%2 but with less code
#print(x)

#x**=2 #Same as x= x**2 but with less code
#print(x)


#COMPARISON OPERATORS
# Returns True or False depending on the values compared.

a: int=1
b: int=5
c: int=10
d: int=10

#Checking whether values are the same or not the same
#print(a==b) #Is a equal to b (Output: False)
#print(c==d) # c is equal to d (Output: True)
#print(c!=d) # c is not equal to d (Output: False)
#print(a!=d) # c is not equal to d (Output: True)

#print(b > a) # b is greater than a  (Output: True)
#print(a > b) # a is greater than b  (Output: False)
#print(c > d) # c is greater than d  (Output: False exactly the same value)
#print(c >= d) # c is greater than or equal to d  (Output: True)
#print(c <= d) # c is less than or equal to d  (Output: True)
#print(c < d) # c is less than  d  (Output: False)
#print(c > b > a) # b is greater than a but less than c  (Output: True)

#LOGICAL OPERATORS
# and checks if all conditions are true
#print(c == d and b > a) #c is equal to d AND b is more than a 
                        # (Output: True)
#print(c == a and b > a) #c is equal to a AND b is more than a 
                        # (Output: Whole expression is False)
#print(c == a and b > a and 5 == 5) #c is equal to a AND b is more than a AND 5 is equal to 5 
                        # (Output: Whole expression is False)

#or checks if at least one condition is true
#print(c == a or b > a ) #c is equal to a OR b is more than a
                        # (Output: Whole expression is True)
#print(c == a or b < a ) #c is equal to a OR b is less than a
                        # (Output: Whole expression is False)
#Negation Operator (not) reverses a condition
#print(not(a >b) ) #a is not greater than b
                        # (Output: True)
#print(not(c == d) ) #c is not equal to d
                        # (Output: False)
#OR write it as print(c != d) (c is not equal to d)


#STRING

#print('text')

#name: str='Mario' #single qoutation marks
#fruit: str="Banana" #double qoutation marks

#name: str='Mario\'s' #Escape quotes, use a backsplash \
#fruit: str="Banana's" #double qoutation marks

#example: str="Qoute: \"Hello there!\"" #double qoutation marks use backsplash

#STRING CONCATENATION (adding strings together)
#print(name + ' eats a '+ fruit)

#Example of triple qoutation marks: adding as many lines as you want, written in the same order
#poem: str= """
#abc
#def
#ghi

#"""

#poem: str= """Roses are Red,
#Violets aren't orange
#I can't find my keys
##The end
#"""

#print(poem)


#TYPE CONVERSION

#These are not compatible with each other (string and integer):
#txt_value: str = '100'
#int_value: int = 50

#Option 1:Converting a string into an integer
#print(int(txt_value)+ int_value)  # (Output: 150)

#Option 1:Converting a integer into a string
#print(txt_value+ str(int_value))  # (Output: 10050)

#Float and an integer: Turning result into a float
#print(5.5+1) # (Output: 6.5)
#print(type(5.5+1)) # (Output: float)


#print(int('ten')) #not compatible (ERROR)
#print(int('100')) # compatible as a number



#Simple Adder(PROJECT)

#print('Welcome to your simple adder!')
#print('-------------------------------')

#a: str= input('Enter a value for a: ') #input grabs the input as a string
#b: str= input('Enter a value for b: ')

#print('-------------------------------')

#print('The result is: ', int(a)+ int(b)) #converting input into a string


#BOOLEANS
#is_connected: bool =True #user has or does not have connection based on boolean
#has_money: bool = False

#print(10>5) #(Output: True)

#True and False are constants for 1 and 0
#print(int(True)) #(Output: 1) / Value turned ON
#print(int(False)) #(Output: 0) / Value turned OFF

#print(True+True) #(Output: 2) 

#if is_connected: print('There is internet!') #(Output: There is internet!') 
