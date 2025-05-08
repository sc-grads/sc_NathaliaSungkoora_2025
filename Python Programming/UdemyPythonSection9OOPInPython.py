#UdemyPythonSection9OOPInPython

# Initializer is a block of code that gets called everytime
#  a new object is created from this class
# class Connection:   #will always have self when creating an initializer
#     def __init__(self, connection_type: str, cost: float) -> None:
#         print(f'{connection_type} connection established! (Cost: ${cost}/h)')
#         self.connection_type = connection_type
#         self.cost = cost

# # Closing connection because we don't want it to run forever
#     def close_connection(self) -> None:
#         print(f'Closing {self.connection_type} connection...')

# def main() -> None:
#     internet: Connection = Connection('Internet', 2)
#     satellite: Connection = Connection('Satellite', 20)
#     # Instance of a connection created (instantiating)
#     # internet here is an object but also an instance

#     internet.close_connection()
#     satellite.close_connection()

# if __name__ == '__main__':
#     main()


#---------------------------------------------------------
#SELF

# # Defining a simple class called Fruit
# class Fruit:
#     # Initializer method for the class
#     def __init__(self, name: str, grams: float) -> None:
#         self.name = name        # an instance attribute
#         self.grams = grams      # is an instance attribute

#     # Method to simulate eating the fruit
#     def eat(self) -> None:
#         print(f'Eating {self.grams}g of {self.name}.')

# # This block runs only if this script is executed directly
# if __name__ == '__main__':
#     # Creating two instances of the Fruit class
#     apple = Fruit('Apple', 25)   # 'self' in this case refers to 'apple'
#     banana = Fruit('Banana', 10) # 'self' here refers to 'banana'

#     # Accessing the attributes of each instance
#     print(apple.name)  # Outputs: Apple
#     # Using the 'eat' method for each fruit
#     apple.eat()   # Outputs: Eating 25g of Apple.
    
#      # Accessing the attributes of each instance
#     print(banana.name) # Outputs: Banana
#     banana.eat()  # Outputs: Eating 10g of Banana.


#--------------------------------------------------------------------------------------
# ATTRIBUTES:CLASS &INSTANCE

# class Car:
#     SPEED_LIMIT_KM: float = 140

#     def __init__(self, brand: str) -> None:
#         self.brand = brand

#     def drive(self, *, speed: float) -> None:
#         if speed> self.SPEED_LIMIT_KM:
#             print(f'Limiter activated: Driving at {self.SPEED_LIMIT_KM}km/h')
#         else:
#             print(f'Driving at {speed}km/h')    

# def main() -> None:
#     toyota: Car = Car('Toyota') 
#     bmw: Car =Car('BMW')

#     toyota.drive(speed=200) 
#     bmw.drive(speed=210) 

# # Here we are updating a class attribute not an instance.
#     Car.SPEED_LIMIT_KM=99 #Updating to 99

#     toyota.drive(speed=200) 
#     bmw.drive(speed=210) 


# if __name__ =='__main__':
#     main()            



#--------------------------------------------------------------------------------------
# DUNDER METHOD
# Defining a simple class called Book
# class Book:
#     # Dunder method to initialize the class 
#     def __init__(self, title: str, pages: int) -> None:
#         self.title = title   # 'self.title' is an instance attribute
#         self.pages = pages   # 'self.pages' is an instance attribute

#     # Dunder method to define how len() works for this class
#     def __len__(self) -> int:
#         return self.pages  # Returns the number of pages as the length

#     # Dunder method to define how addition (+) works for this class
#     def __add__(self, other: 'Book') -> 'Book':
#         combined_title: str = f'{self.title} & {other.title}'  # Combining the titles
#         combined_pages: int = self.pages + other.pages          # Summing the pages
#         return Book(combined_title, combined_pages)       # Returning a new combined book

# # This block runs only if this script is executed directly
# if __name__ == '__main__':
#     # Creating two book instances
#     pi_daily:  Book=Book('Pi Daily', 100)   
#     harry_potter: Book=Book('Harry Potter', 340)

#     # Using the len() function with our custom __len__ method
#     print(len(pi_daily))      # Outputs: 100
#     print(len(harry_potter))  # Outputs: 340

#     # Using the + operator with our custom __add__ method
#     combined_books = pi_daily + harry_potter

#     # Displaying the combined book
#     print(combined_books.title)  # Outputs: Pi Daily & Harry Potter
#     print(combined_books.pages)  # Outputs: 440

#--------------------------------------------------------------------------------------
# Dunder Method:__str__() & __repr__()

# class Person:
#     def __init__(self, name: str, age: int)->None:
#         self.name = name
#         self.age = age
#     # This method easy to read for user
#     def __str__(self)-> str:
#         return f'{self.name}: {self.age} years old'
#      # This method more technical (developer)
#     def __repr__(self)-> str:
#         return f'Person (name={self.name}, age={self.age})'

# def main() -> None:
#     mario: Person =Person('Mario', 27)
#     print(mario)
#     print(repr(mario))

# if __name__ == '__main__':
#     main()    


#--------------------------------------------------------------------------------------
# Dunder Method:__eq__() 

# from typing import Self

# # Car class with dunder method for comparison
# class Car:
#     # Initializer for the Car class
#     def __init__(self, brand: str, car_id: int, colour: str) -> None:
#         self.brand = brand  #Assigning to instances
#         self.car_id = car_id
#         self.color = colour

#     # Dunder method for equality comparison
#     def __eq__(self, other: Self) -> bool:
#         # Comparing all attributes of the car using their dictionaries
#         print('Current:', self.__dict__)
#         print('Other:', other.__dict__)
#         return self.__dict__ == other.__dict__

# # Main block to test the Car class
# if __name__ == '__main__':
#     # Creating two car objects with the same properties
#     car1 = Car('BMW', 1, 'Red')
#     car2 = Car('BMW', 1, 'Red')

#     # Comparing the two cars (should return True)
#     print(car1 == car2)  #Output: True because all attributes are identical

#     # Creating another car with different properties
#     car3 = Car('BMW', 2, 'Blue')

#     # Comparing different cars (should return False)
#     print(car1 == car3)  # Output: False because car_id and color differ


    
    


