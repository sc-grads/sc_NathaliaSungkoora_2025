#FUNCTIONS

#def greet():
   # print('Hello')
    #print('------')

#greet()    
#greet()
#greet()  
# 
# 
# DATE TIME EXAMPLE 
#Promotes usuability and makes it easier to reuse
#from datetime import datetime
#import time
#def show_time():
    #now: datetime = datetime.now()
    #print(f'Time: {now:%H:%M:%S}')

#show_time()
#time.sleep(2)
#show_time()

#----------------------------------------

#PASS

#def get_status():
    #pass #ignores this line of code

#def connect_to_internet():
    #pass #ignores this line of code

#Can insert it anywhere, not just with Functions:
#number: int=2
#if number>0:
    #pass #ignores this line of code
#else:
    #... #ELIPSIS serves the same pupose as pass-ignores this line of code


#PARAMETERS AND ARGUMENTS

#def greet(name:str): #defining it is called parameter
    #print(f'Hello, {name}!')

##greet('James')


#Example of more than one parameter:
#Passing value into a function is called an argument

#def greet(name:str, language: str, default: str='Hello'): #define default
    #if language == 'it':
       # print(f'Ciao, {name}!')
    #else:
        #print(f'{default}, {name}!')  #will print default if anything else is received  

#greet(name='Mario', language='it', default='Hello' )
        #Key word arguments: words associated with a value
        #Refers to specific things, order does not matter


#RETURN FUNCTIONS

#def get_length(text: str) -> int:
    #print(f'Getting the length of : "{text}"...')
    #return len(text)

#name: str ='Mario'
#length: int = get_length(name)
#print(length) #Output: "Getting the length of : "Mario"..."" and "5"


#Another example:
#def make_upper(text:str)-> str:
    #return text.upper()
#print(make_upper('hello')) #Output: HELLO

#Creating a function that doesn't receive it
#def connect_to_internet()-> None:
   # print('Connecting to internet...')
#print(connect_to_internet()) #Output: None


#RECURSION
#def func()-> None:
    #print('Recursion')
    #func() #will contiue forever until error appears

#import time


#Another example: If connection fails, try again in a few more seconds
#def connect_to_internet(signal: bool, delay: int) -> None:
    #if delay > 5:
       # signal= True
    #if signal:
        #print('Connected')    
    #else:
        #time.sleep(delay) 
        #connect_to_internet (signal, delay + 2)

#connect_to_internet(False, 0)


#ARGUMENTS AND KEY WORD ARGUMENTS
#print(1,2,3,'hello', sep=':') #Output: 1:2:3:hello

#def add(*args: int)-> int:
    #print(args)
   #return sum(args)

#print(add(1, 2, 3)) #Output: Arguments (1, 2, 3) and Sum: 6

#args converts all the values we put in and converts it to a tuple
#Syntax: *args or *number (have asteriks)

#Example of args:

#def greet(greeting: str, *people: str, ending: str)->None:
    #for person in people:
        #print(f'{greeting}, {person}{ending}')
#greet('Hello', 'Bob', 'James', 'Maria', ending='!')


#Example of kwargs:

#def pin_position(**kwargs: int)-> None: #Everything absorbed by **kwargs
    #print(kwargs)

#pin_position(x=10, y=20) # Output: {'x': 10, 'y': 20}
#kwargs function will create a dictionary from this

#*args must come before **kwargs:
#def func(*args: str, **kwargs: int)-> None:
    #print(args)
    #print(kwargs)

#func('a', 'b', a=1, b=2)   #Correct way to call function
                        #Outputs: args get converted into a tuple
                               # kwargs converted into dictionary
                               #('a', 'b') tuple
                             # {'a': 1, 'b': 2}dictionary
#Another example using default:
#def func(*args: str, default: int, **items: int)-> None:
    #print(args)
    #print(items)
    #print(default)

#func('a', 'b', default=20, a=1, b=2) #have to add default key word here


#ASTERIKS (*) AND SLASH(/) 
#/ mean everything before "/" can't be passed in as a keyword argument
#/ mean everything after  "/" can be passed in as a keyword argument
#  or positional for example ('a', var_b='b') or('a', 'b')
#def func(var_a: str, /, var_b: str)->None:
    #print(var_a)
    #print(var_b)
#func('a', 'b') #Correct way to call function (can't pass a key word argument)
                #Output: a b (must be positional)

#*mean everything before "*" can be passed in as a keyword argument
#  or positional for example (var_a='a', 'b') or('a', 'b')
#* mean everything after  "*" must be passed in as a keyword argument
#  ('a', var_b='b') 
#def func(var_a: str, *, var_b: str)->None:
    #print(var_a)
    #print(var_b)
#func('a', var_b='b')   #Output: a b (var_b must be positional)

#BOTH AT THE SAME TIME:
#def func(var_a: str, /, var_b: str,*, var_c: str)->None:
    #print(var_a)   #Everything in front of slash must be positional
    #print(var_b)   #Everything in between / and * can be either
    #print(var_c)
#func('a',  'b', var_c='c')   
#func('a',  var_b='b', var_c='c')  


