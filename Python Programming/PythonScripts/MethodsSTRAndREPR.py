# MAGIC METHODS __STR__ AND __REPR__

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age


bob = Person("Bob", 35)
print(bob)  # Output displayed as an object not string
            #OUTPUT = <__main__.Person object at 0x000001DE194C6F90>
# Using __str__
#easy to read format for end users


class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return f"Person {self.name}, {self.age} years old"


bob = Person("Bob", 35)
print(bob)  # OUTPUT = Person Bob, 35 years old



# __REPR__ EXAMPLE (mainly used for python debugging/PROGRAMMERS)
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __repr__(self):
        return (
            f"<Person({self.name!r}, {self.age})>"
        )  # !r calls the __repr__ method of the thing.


bob = Person("Bob", 35)
print(bob) #OUTPUT = <Person('Bob', 35)>
