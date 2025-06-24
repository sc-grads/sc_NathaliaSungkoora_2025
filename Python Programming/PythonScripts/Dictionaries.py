#DICTIONARIES

friend_ages = {"Rolf": 24, "Adam": 30, "Anne": 27}

#Add a key/ change an existing key:
friend_ages["Bob"] = 20

print(friend_ages)  #Output: {'Rolf': 24, 'Adam': 30, 'Anne': 27, 'Bob': 20}
print(friend_ages["Bob"]) #Output: 20

# LIST OF DICTIONARIES

#Creating a list of friends and printing it out
friends = [
    {"name": "Rolf Smith", "age": 24},
    {"name": "Adam Wool", "age": 30},
    {"name": "Anne Pun", "age": 27},
]

print(friends) #Output: [{'name': 'Rolf Smith', 'age': 24}, {'name': 'Adam Wool', 'age': 30}, {'name': 'Anne Pun', 'age': 27}]
print(friends[1]) #Output (using index to retrieve data): {'name': 'Adam Wool', 'age': 30}
print(friends[1]["name"]) #Output (accessing name only): Adam Wool




# -- Iteration --
student_attendance = {"Rolf": 96, "Bob": 80, "Anne": 100}

for student in student_attendance:
    print(f"{student}: {student_attendance[student]}")
#Output: Rolf: 96 Bob: 80 Anne: 100


# Writing code in a BETTER way

for student, attendance in student_attendance.items():
    print(f"{student}: {attendance}")
    # Output: Rolf: 96 Bob: 80 Anne: 100s

#Using IN Keyword

if "Bob" in student_attendance: #IN checks if one of values is IN the keys
    print(f"Bob: {student_attendance['Bob']}") #Output: Bob: 80
else:
    print("Bob isn't a student in this class!")

#Using .values to calculate Average

attendance_values = student_attendance.values()
print(sum(attendance_values) / len(attendance_values))
#Output: 92.0




#Dictionaries and Students Coding Exercise
# Create a variable called student, with a dictionary.
# The dictionary must contain three keys: 'name', 'school', and 'grades'.
# The values for each must be 'Jose', 'Computing', and a tuple with the values 66, 77, and 88.
student = {
    'name': 'Jose',
    'school': 'Computing',
    'grades': (66, 77, 88)
}
# Assume the argument, data, is a dictionary.
# Modify the grades variable so it accesses the 'grades' key of the data dictionary.
def average_grade(data):
    grades =  data['grades'] 
    return sum(grades) / len(grades)


# Implement the function below
# Given a list of students (a list of dictionaries), calculate the average grade received on an exam, for the entire class
# You must add all the grades of all the students together
# You must also count how many grades there are in total in the entire list
def average_grade_all_students(student_list):
    total = 0
    count = 0
    for student in student_list:
        grades = student['grades']
        total += sum(grades)    
        count += len(grades)

    return total / count