#TRUTHY AND FALSY

#----------------------------------------------------------
# 1 =True and 0 = False

#Checking
#print(bool([])) #Output: False (Empty lists return false)
#print(bool((None))) #Output: False
#print(bool([200])) #Output: True


# Practical example: Checking for users
#users: dict = {1: "Mario", 2: "Luigi", 3: "James" }

#if users: #Truthy value =TRUE
   # for k, v in users.items():
        #print(k, v, sep=': ')
  
#else:
   # print("No data found.")
#----------------------------------------------------------

# COMPARING FLOATS

#print(.1 +.2 ==.3)
#print(f'.1 +.2 ={.1 + .2}') 
        #Output: .1 +.2 =0.30000000000000004
        #Storing this will take up a lot of memory

#-------------------------------------------------------------

#Example:

#from math import isclose

#a: float = .1 +.2 
#b: float = 1.000

#print(f'{a} == {b}?', isclose(a, b, rel_tol=.001))
        # Example: print(f'{a} == {b}?', isclose(a, b, abs_tol=.002))
        #absolute tolerance doesn't scale with numbers 
        #must be in that range to be considered

#----------------------------------------------------------------        
# Python Scope Demonstration

# Global Scope Variable
#number: int = 999

#def print_number() ->None:
    # Local Scope
    #number = 10  # This creates a new local variable, shadowing the global 'number'.
#print(number) #Output still 999


#----------------------------------------------
# Referring to global number:
#number: int = 0

#def change_number() ->None:
   # global number
    #number = 10

#print(number)
#change_number()
#print(number)    
 #----------------------------------------
#Non local

#def outer_func() -> None:
   # name: str = ' '
    #value: int = 0

    #def inner_func() -> None:
        #nonlocal name, value  # use nonlocal, separate with comma
        #name = 'Tom'
        #value = 100

    #inner_func()   
    #print(name, value) #Output: Tom 100

