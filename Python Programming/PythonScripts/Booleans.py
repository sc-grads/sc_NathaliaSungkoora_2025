#BOOLEANS
# TRUE OR FALSE

#COMPARING VALUES WITH ONE ANOTHER

print(5 == 5)  # True
print(5 > 5)  # False
print(10 != 10)  # False (IS 10 DIFFERENT FROM 10)

# Comparisons: ==, !=, >, <, >=, <=


#Looking at IS keyword
friends = ["Rolf", "Bob"]
abroad = ["Rolf", "Bob"]

print(friends == abroad)  # True (== Compares whether the elemnets inside them are the same)
print(friends is abroad)  # False (is keyword checks if they are EXACTLY the same , not if elements are the same within them)
print(friends is friends)  # True 
