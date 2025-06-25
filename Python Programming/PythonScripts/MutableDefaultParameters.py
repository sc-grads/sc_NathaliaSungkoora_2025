#MUTABLE DEFAULT PARAMETERS

from typing import List


class Student:
    def __init__(self, name: str, grades: List[int] = []):  # Problem here!
        self.name = name
        self.grades = grades # All students will share this same list if not fixed

    def take_exam(self, result):
        self.grades.append(result)


bob = Student("Bob")
rolf = Student("Rolf")
bob.take_exam(90)
print(bob.grades) #OUTPUT = [90]
print(rolf.grades) #OUTPUT = [90] SHOWS SAME MARK AS BOB EVEN THOUGH ROLF DID NOT WRITE EXAMS


#HOW TO FIX

from typing import List, Optional


class Student:
    def __init__(self, name: str, grades: Optional[List[int]] = None):
        self.name = name
        self.grades = grades or [] # Creates a new list if none provided

    def take_exam(self, result):
        self.grades.append(result)


bob = Student("Bob")
rolf = Student("Rolf")
bob.take_exam(90)
print(bob.grades) #OUTPUT = [90]
print(rolf.grades) #OUTPUT = []


