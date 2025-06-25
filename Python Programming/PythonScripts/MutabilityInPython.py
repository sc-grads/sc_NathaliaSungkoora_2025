# MUTABILITY IN PYTHON


a = []
b = a

#IDS ARE THE SAME FOR BOTH OBJECTS
#A and B are referencing the same list
print(id(a)) #OUTPUT= 1449222775936
print(id(b)) #OUTPUT= 1449222775936

#A and B are referencing the same list:
a.append(35)  # Modify the value.

print(a) #OUTPUT= [35]
print(b) #OUTPUT= [35]


# If you have two lists:
a = []
b = []
a.append(35)

##IDS ARE THE DIFFERENT FOR BOTH OBJECTS

print(id(a))  #OUTPUT= 2215034588992
print(id(b))  #OUTPUT= 2215034363008
print(a) #OUTPUT= [35]
print(b) #OUTPUT= []

#LISTS ARE MUTABLE= CAN BE CHANGED
#TUPLES ARE IMMUTABLE=CANNOT BE CHANGED
#INTEGERS ARE ALSO IMMUTABLE =CANNOT BE CHANGED
#
#EXAMPLE OF INTEGERS

a = 12345
b = 12345

#IDS ARE THE SAME FOR BOTH OBJECTS
#A and B are referencing the same list
print(id(a)) #OUTPUT= 2212632376240
print(id(b)) #OUTPUT= 2212632376240
print(a) #OUTPUT= 12345
print(b) #OUTPUT= 12345



###

# STRINGS ARE IMMUTABLE

a = "hello"
b = a

print(id(a))  # OUTPUT = same ID
print(id(b))  # OUTPUT = same ID

# Changing a string creates a new object (since strings are immutable)
a += "world"  # same as a = a + "world"

print(id(a))  # OUTPUT = different ID
print(id(b))  # OUTPUT = original ID (unchanged)