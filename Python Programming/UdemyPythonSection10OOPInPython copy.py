# # OOP IN PYTHON (SECTION 10)

# #----------------------------------------------------------
# #INHERITANCE
# class Animal:
#     def __init__(self, name: str) -> None:
#         self.name =name

#     def drink(self)->None:
#         print(f'{self.name} is drinking.')    
        
#     def eat(self)->None:
#         print(f'{self.name} is eating.')    
# #Dog Class
# class Dog(Animal):
#     def __init__(self, name: str) -> None:
#         super().__init__(name)
#     def bark(self)-> None:
#         print(f'{self.name} bark bark!')

#     def routine(self) ->None:
#         self.eat()
#         self.bark()
#         self.drink()
# # Another class (Cat)
# class Cat(Animal):
#     def __init__(self, name: str) -> None:
#         super().__init__(name)
#     def meow(self)-> None:
#         print(f'{self.name} meow meow!')     

# def main() ->None:
#     dog: Dog = Dog('Buddy')
#     cat: Cat = Cat('Snowball')

#     #Each has their own special functionality
#     dog.bark()  # Output: Buddy bark bark!
#     cat.meow()  # Output: Snowball meow meow!

#     #Shareed functionality:
#     dog.eat()  # Output: Buddy is eating.
#     cat.eat() # Output: Snowball is eating.

# if __name__ == '__main__':
#     main()  
# 
# # #----------------------------------------------------------
# #super() (SUPER)    
# 
# from typing import override

# class Shape: 
#     def __init__(self, name: str, sides: int)-> None:
#         self.name =name
#         self.sides = sides

#     def describe(self) -> None:
#         print(f'{self.name} ({self.sides} sides)')
#     def shape_method(self) -> None:
#         print(f'{self.name}: shape_method')    

# # Adding another class
# class Square(Shape): 
#     def __init__(self, size: float)-> None: 
#         super().__init__('Square', 4) 
#         #Super refers to parent class 
#         self.size = size     

#         #Adding override : overrides the original
#     @override
#     def describe(self)-> None:
#         print(f'I am a {self.name} with a size of {self.size}')

# class Rectangle(Shape):
#     def __init__(self, length: float, height: float):
#         super().__init__('Rectangle', 4)
#         self.length = length
#         self.height = height

#     @override
#     def describe(self)-> None:
#         print(f'I am a {self.name} ({self.height} x {self.length})')

# def main() -> None:
#    # square: Square =Square(20)
#    # square.describe()
#    # square.shape_method()
#     rectangle: Rectangle =Rectangle (10, 15)
#     rectangle.describe()
#     rectangle.shape_method()


# if __name__ == '__main__':
#      main()  
# #------------------------------------------------------------------     
# #Static Method (@staticmethod)

# class Calculator:
#     def __init__(self, version: int)-> None:
#         self.version =version

#     @staticmethod
#     #Grouping functionality with the class.
#     def add(*numbers: float) -> float:
#         return sum(numbers)   
#     def get_version(self)-> int:
#         return self.version

# def main() -> None:
#     #calc: Calculator = Calculator(version=1) (original way)

#     result: float = Calculator.add(1,2,3,4) #makes code simpler
#     print(result) #Output: 10

# if __name__ =='__main__':
#     main()    

# #------------------------------------------------------------------    
#CLASS METHOD (@classmethod)

# class Car:
#     LIMITER: int = 200

#     def __init__(self, brand: str, max_speed: int) -> None:
#         self.brand =brand
#         self.max_speed = max_speed

# #Creating a method that affects the actual class(car):
#     @classmethod
#     def change_limit(cls, new_limit: int) -> None:
#         cls.LIMITER = new_limit

#     def display_info(self)->None:
#         print(f'{self.brand} (max={self.max_speed}, limiter={self.LIMITER})')   

# def main() -> None:
#     bmw: Car = Car('BMW', 240)
#     toyota: Car = Car('Toyota', 190)

#     #Displaying inro
#     bmw.display_info()  #Output: BMW (max=240, limiter=200)
#     toyota.display_info() #Output:Toyota (max=190, limiter=200)

#     #Changing the limiter
#     Car.change_limit(150) #class method affects all instances (bmw and toyota)
#         #Diff in toyota.Limiter=150-> this mean only toyota will be changed only (using inctance attributes)


#     #Displaying now will mean all cars wil have the limiter
#     bmw.display_info()  #Output: BMW (max=240, limiter=150)
#     toyota.display_info() #Output:Toyota (max=190, limiter=150)

# if __name__ =='__main__':
#     main()    

 #------------------------------------------------------------------    

    #Factory Method 
    #Used to create instances with slightly different setups
# from typing import Self

# class Car:
#     LIMITER: int = 200

#     def __init__(self, brand: str, max_speed: int) -> None:
#         self.brand =brand
#         self.max_speed = max_speed

# #Creating a method that affects the actual class(car):
#     @classmethod
#     def change_limit(cls, new_limit: int) -> None:
#         cls.LIMITER = new_limit

#     # Creating another method
#     @classmethod                  #returns self as an instance of the class
#     def autogenerate_max_speed(cls, brand: str)-> Self:
#         lowered: str = brand.lower()
#         max_speed: int = 200 #default speed

#         if lowered =='toyota':
#             max_speed =270
#         elif lowered =='bmw':
#             max_speed =290   
#         elif lowered =='volvo':
#             max_speed =300

#         #return the class based custom setup (brand and max speed)
#         return cls(brand, max_speed)

#         #Check brand and provide appropriate speed

#     def display_info(self)->None:
#         print(f'{self.brand} (max={self.max_speed}, limiter={self.LIMITER})')   

# def main() -> None:
#    volvo: Car =Car.autogenerate_max_speed('Volvo')
#    volvo.display_info()  # Output: Volvo (max=300, limiter=200)

# if __name__ =='__main__':
#     main()    

#------------------------------------------------------------------    
#ABSTRACT METHOD (abstractmethod)

#---------------
#EXAMPLE 1: 
# from abc import ABC, abstractmethod
#  #This is a blueprint and won't implement functiobnality
# class Appliance(ABC):
#     def __init__(self, brand: str, version_no: int) -> None:
#         self.brand = brand
#         self.version_no = version_no
#         self.is_turned_on: bool = False
#  #This is end of blueprint and won't implement functiobnality 
#  # Used to tell other classes what they should do.
    
#     @abstractmethod
#     def turn_on(self)-> None:
#         ...      
    
#     @abstractmethod
#     def turn_off(self)-> None:
#         ...

# #Creating new class that inherents from Appliance
# class Lamp(Appliance):
#     def __init__(self, brand: str, version_no: int) -> None: 
#         super().__init__(brand, version_no) 

#     def turn_on(self)-> None:
#         if self.is_turned_on:
#             print(f'{self.brand} is already turned on!')
#         else:
#             self.is_turned_on =True
#             print(f'{self.brand} is now turned on!')  

#     def turn_off(self)-> None:
#         if self.is_turned_on:
#             self.is_turned_on =False
#             print   (f'{self.brand} is now turned off!')  
#         else:
#             print(f'{self.brand} is already turned off!')      

# def main() -> None:
#    lamp: Lamp = Lamp('Z-Lite', 1)
#    lamp.turn_on()
#    lamp.turn_on()
#    lamp.turn_off()
#    lamp.turn_off()
#    lamp.turn_on()
#    lamp.turn_off()

# if __name__ =='__main__':
#     main()    

#---------------
#EXAMPLE 2: 

# from abc import ABC, abstractmethod
#  #This is a blueprint and won't implement functiobnality
# class Appliance(ABC):
#     def __init__(self, brand: str, version_no: int) -> None:
#         self.brand = brand
#         self.version_no = version_no
#         self.is_turned_on: bool = False
#  #This is end of blueprint and won't implement functiobnality 
#  # Used to tell other classes what they should do.
    
#     @abstractmethod
#     def turn_on(self)-> None:
#         ...      
    
#     @abstractmethod
#     def turn_off(self)-> None:
#         ...

# #Creating new class that inherents from Appliance
# class Lamp(Appliance):
#     def __init__(self, brand: str, version_no: int) -> None: 
#         super().__init__(brand, version_no) 

#     def turn_on(self)-> None:
#         if self.is_turned_on:
#             print(f'{self.brand} is already turned on!')
#         else:
#             self.is_turned_on =True
#             print(f'{self.brand} is now turned on!')  

#     def turn_off(self)-> None:
#         if self.is_turned_on:
#             self.is_turned_on =False
#             print   (f'{self.brand} is now turned off!')  
#         else:
#             print(f'{self.brand} is already turned off!')   

# #CREATING ANOTHER CLASS CALLED OVEN
# class Oven(Appliance):
#     def __init__(self, brand: str, version_no: int) -> None: 
#         super().__init__(brand, version_no)               

#  #RAISING A NOT IMPLEMENTED ERROR instead of pass or elipsis
#     def turn_on(self)-> None:
#         raise NotImplementedError('Need to add functionality for turn_on()')  
 
#     def turn_off(self)-> None:
#         raise NotImplementedError('Need to add functionality for turn_off()') 

# def main() -> None:
#     oven: Oven =Oven('Bosch', 2)
#     oven.turn_on()
#     oven.turn_off()

# if __name__ =='__main__':
#     main()    

#------------------------------------------------------------------    
# NAME MANGLING

#1. Encapsulating data making it harder to access objects 
# that should not be acccesed outside of the class.
#2. Prevent name classes in the case of inheritance

# Importing the ABC module for creating abstract base classes
# from abc import ABC, abstractmethod

# # Creating a base class called 'Car'
# class Car:
#     # Defining a constant attribute with double underscores for name mangling
#     __YEAR: int = 2000

#     # Initializer method to set brand and fuel type
#     def __init__(self, brand: str, fuel_type: str) -> None:
#         # Attributes with double underscores (name mangled)
#         self.__brand = brand
#         self.__fuel_type = fuel_type
#         # A regular attribute without name mangling
#         self._Car__var: str = "red" #name mangling here

#     # A method to drive the car
#     def drive(self) -> None:
#         print(f"Driving {self.__brand}.")

#     # Name-mangled method (double underscore)
#     def __get_description(self) -> None:
#         print(f"{self.__brand}: {self.__fuel_type}")

#     # Method to display the car color
#     def display_color(self) -> None:
#         print(f"{self.__brand} is {self.__var.capitalize()}.")

# #ADDING A CLASS
# class Toyota(car):
#     def __init__(self, brand: str, fuel_type: str)->None:
#         super().__init__('Toyota', fuel_type)
#         self.var =100

# # Main section
# if __name__ == '__main__':
#     # Creating an instance of Car
#     car: Car = Car("Toyota", "Electric")

#     # Using the drive method (works normally)
#     car.drive() #Outout: Driving Toyota.

#     # Accessing name-mangled attributes and methods using the mangled name
#     car._Car__get_description()#Outout: Toyota: Electric
#     print(car._Car__brand) #Outout:Toyota

#------------------------------------------------------------------    


