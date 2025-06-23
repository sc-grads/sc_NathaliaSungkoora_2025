#IN KEYWORD

friends = ["Rolf", "Bob", "Jen"]
print("Jen" in friends) #TRUE


# Using a SET because it allows unique values

movies_watched = {"The Matrix", "Green Book", "Her"}
user_movie = input("Enter something you've watched recently: ")

print(user_movie in movies_watched)

#Output: The Matrix =TRUE
#Output: Monty Python =FALSE
# The `in` keyword works in most sequences like lists, tuples, and sets.