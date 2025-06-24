# OBJECT ORIENTATED PROGRAMMING

student = {"name": "Rolf", "grades": (89, 90, 93, 78, 90)}


def average(sequence):
    return sum(sequence) / len(sequence)


print(average(student["grades"])) #OUTPUT(average grade)= 88.0


##Written using OBJECT ORIENTED PROGRAMMING
#Function inside a class is called a method

class Student:
    def __init__(self):  # Runs when a new Student is created
        self.name = "Rolf"  # Set the name of the student

student = Student()  # Create a new Student object
print(student.name)  # OUTPUT = Rolf (gets the name from the object)


#Another example getting grades
class Student:
    def __init__(self):
        self.name = "Rolf"
        self.grades = (89, 90, 93, 78, 90)  # Set grades as a tuple

student = Student()
print(student.grades)  # OUTPUT = (89, 90, 93, 78, 90) (prints the grades tuple)


#Defining the AVERAGE METHOD as well
#All methods inside class should have a self parameter to take in object
class Student:
    def __init__(self):
        self.name = "Rolf"
        self.grades = (89, 90, 93, 78, 90)

    def average(self):  # Method to calculate the average of grades
        return sum(self.grades) / len(self.grades)

student = Student()
print(student.average())  # OUTPUT (average grade) = 88.0

# PARAMETERS IN __init__ (let you pass values when creating the object)

class Student:
    def __init__(self, name, grades):  # name and grades are given when we create a student
        self.name = name               # store the name in the object
        self.grades = grades           # store the grades in the object

    def average(self):  # this method calculates the average of the grades
        return sum(self.grades) / len(self.grades)

# Create a student with a name and grades
student = Student("Bob", (36, 67, 90, 100, 100))

# Print the name (no brackets because it's not a function)
print(student.name)       # OUTPUT: Bob

# Print the average grade
print(student.average())  # OUTPUT: 78.6


##Same example with TWO Students

class Student:
    def __init__(self, name, grades):  # name and grades are given when we create a student
        self.name = name               # store the name in the object
        self.grades = grades           # store the grades in the object

    def average(self):  # this method calculates the average of the grades
        return sum(self.grades) / len(self.grades)

# Create a student with a name and grades
student = Student("Bob", (36, 67, 90, 100, 100))
student2 = Student("Rolf", (40, 56, 88, 99, 98))
# Print the name (no brackets because it's not a function)
print(student.name)       # OUTPUT: Bob
print(student2.name)      # OUTPUT: Rolf
# Print the average grade
print(student.average())  # OUTPUT: 78.6
print(student2.average())  # OUTPUT: 76.2