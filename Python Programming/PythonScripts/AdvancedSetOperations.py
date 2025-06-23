#ADVANCED SET OPERATIONS

#Defining sets:
friends = {"Bob", "Rolf", "Anne"}
abroad = {"Bob", "Anne"}

#local_friends ={"Sam"} #Defining set with one element (example of hard coding an element)

local = friends.difference(abroad) #calculating difference between two sets to determine local friend
print(local) #Output= {'Rolf'}

#Example of empty set syntax = set()
print(abroad.difference(friends))  # Returns an EMPTY set = set()

# Using UNION to COMBINE two SETS

local = {"Rolf"}
abroad = {"Bob", "Anne"}


friends = local.union(abroad)
print(friends) #Output = {'Rolf', 'Bob', 'Anne'}



#INTERSECTION of two SETS

art = {"Bob", "Jen", "Rolf", "Charlie"}
science = {"Bob", "Jen", "Adam", "Anne"}

both = art.intersection(science)
print(both) #Output = {'Bob', 'Jen'}