# LISTS, TUPLES AND SETS


l = ["Bob", "Rolf", "Anne"] #Lists: Defined by square brackets and seperated by a comma. Order is kept.
t = ("Bob", "Rolf", "Anne") #Tuple:  Defined by curved brackets and seperated by a comma. Order is kept.
s = {"Bob", "Rolf", "Anne"} # Set:Defined by curly brackets seperated by a comma. Can't have duplicate elements. Order not guaranteed, can change at any moment.

#Use index to access individual items in lists and tuples (order stays the same):
#Cannot do the same for sets as order is not gauranteed and can change

print(l[0]) #Bob
print(t[0]) #Bob
# print(s[0])  Gives error

# Modify individual items in lists using the index:

l[0] = "Smith" #List changes to ['Smith', 'Rolf', 'Anne']
# t[0] = "Smith"  # Gives an error because tuples are "immutable"(Cannot be modified after they have been created).

print(l)
print(t)

# Add elements to a list by using `.append`

l.append("Jen")
print(l) #Output= ['Smith', 'Rolf', 'Anne', 'Jen']
# Tuples cannot be appended to because they are immutable (Cannot be modified after they have been created).


# Remove elements from list 
l.remove("Smith")
print(l[1]) # Output: ['Rolf', 'Anne', 'Jen']

# Add to sets by using `.add`

s.add("Smith")
print(s) #Output= {'Smith', 'Rolf', 'Anne', 'Bob'}

# Sets can't have the same element twice.

s.add("Smith")
print(s) #Same Output (no duplicates in set)= {'Smith', 'Rolf', 'Anne', 'Bob'}



#Lists, tuples, and set (Python 3.10)
#EXERCISE

# Create a list, called my_list, with three numbers. The total of the numbers added together should be 100.
my_list=[60, 30, 10]

# Create a tuple, called my_tuple, with a single value in it
my_tuple = (10,)

# Modify set2 so that set1.intersection(set2) returns {5, 77, 9, 12}
set1 = {14, 5, 9, 31, 12, 77, 67, 8}
set2 = {5, 77, 9, 12}
both = set1.intersection(set2)
print(both)