#DESTRUCTURING VARIABLES

#x, y = 5, 11
# x, y = (5, 11)

#DESTRUCTURING a TUPLE
t = (5, 11) # creates a tuple
x, y = t #unpacks the tuple into two variables
print (x, y) # Output = 5 11 (shows the result)


# Another example of Destructuring in a FOR LOOP:
student_attendance = {"Rolf": 96, "Bob": 80, "Anne": 100}

for student, attendance in student_attendance.items():
    print(f"{student}: {attendance}")

    #Output is destructured:
    # Rolf: 96
    # Bob: 80
    # Anne: 100


#Another Example of Destructuring:

people = [("Bob", 42, "Mechanic"), ("James", 24, "Artist"), ("Harry", 32, "Lecturer")]

for name, age, profession in people:
    print(f"Name: {name}, Age: {age}, Profession: {profession}")
    #OUTPUT:
# Name: Bob, Age: 42, Profession: Mechanic
# Name: James, Age: 24, Profession: Artist
# Name: Harry, Age: 32, Profession: Lecturer

#Alternatively use INDICES to print out info

for person in people:
    print(f"Name: {person[0]}, Age: {person[1]}, Profession: {person[2]}")

    # OUTPUT:
    # Name: Bob, Age: 42, Profession: Mechanic
    # Name: James, Age: 24, Profession: Artist
    # Name: Harry, Age: 32, Profession: Lecturer

# Use an underscore _ to ignore values in a tuple/list:

person = ("Bob", 42, "Mechanic")
name, _, profession = person

print(name, profession)  #Output: Bob Mechanic



#Collecting VALUES:

head, *tail = [1, 2, 3, 4, 5]

print(head)  #  OUTPUT: 1 ( gets the first value )
print(tail)  #  OUTPUT: [2, 3, 4, 5] (collects everything else)


*head, tail = [1, 2, 3, 4, 5]
print(head) # OUTPUT: [1, 2, 3, 4]
print(tail) # OUTPUT: 5