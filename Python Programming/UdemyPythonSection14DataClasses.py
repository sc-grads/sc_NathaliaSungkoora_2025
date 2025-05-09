#DATA CLASSES (SECTION 14)

#-----------------------------------------------------------------
# DATA CLASS (@dataclass)

# Importing dataclass from the dataclasses module
# from dataclasses import dataclass

# # Defining a data class for a cryptocurrency
# @dataclass #Holds and represents data
# class Coin:
#     name: str  # Name of the cryptocurrency
#     value: float  # Value of the cryptocurrency
#     id: str  # Unique ID for the cryptocurrency

# # Main function to demonstrate data classes
# def main() -> None:
#     # Creating cryptocurrency objects
#     bitcoin: Coin = Coin('Bitcoin', 10000, 'BTC')
#     bitcoin2: Coin = Coin('Bitcoin', 10000, 'BTC')
#     ripple: Coin = Coin('Ripple', 200,'XRP')
#             #these do not contain functionalit, they hold info

#     # Displaying the coins
#     print(bitcoin)  # Output: Coin(name='Bitcoin', value=10000, id='BTC')
#     print(ripple)   # Output: Coin(name='Ripple', value=200, id='XRP')

# # Comparing the coins and checking the values by default
#     print(bitcoin == ripple)  # Output: False
#     print(bitcoin == bitcoin2)  # Output: True

# #------------------
#  # Showing a regular class without dataclass for comparison
#     class CoinRegular:
#         def __init__(self, name: str, value: float, coin_id: str) -> None:
#             self.name = name
#             self.value = value
#             self.coin_id = coin_id


# if __name__ =='__main__':
#     main()


#-----------------------------------------------------------------
# FIELDS
# from dataclasses import dataclass, field
# from typing import List

# # Creating a data class for Fruit
# @dataclass
# class Fruit:
#     name: str
#     grams: float
#     price_per_kilo: float
#     edible: bool =  True # Default value for edible (field(default=True) )
#     related_fruits: List[str] = field(default_factory=list)  # Using default_factory for mutable type

# # Creating fruits with default and custom values
# def main() -> None:
#     # Fruit with default values
#     apple: Fruit = Fruit('Apple',100,5)
#     print(apple)  # Output: Fruit(name='Apple', grams=100, price_per_kilo=5, edible=True, related_fruits=[])

#     # Fruit with custom values
#     pear = Fruit('Pear', 250, 10, related_fruits=['Apple', 'Orange'])
#     print(pear)  # Output: Fruit(name='Pear', grams=250, price_per_kilo=10, edible=True, related_fruits=['Apple', 'Orange'])
#     print(pear.related_fruits) #Output: ['Apple', 'Orange']

# if __name__ == '__main__':
#     main()

#-----------------------------------------------------------------
# POST INITIALIZER
# (__post_ init__)    

# importing data class and field
# from dataclasses import dataclass, field

# # defining a data class for Fruit
# @dataclass
# class Fruit:
#     name: str
#     grams: float
#     price_per_kilo: float
#     total_price: float = field(init=False)

#     # post initializer to calculate total price
#     def __post_init__(self)->None:
#         self.total_price = (self.grams / 1000) * self.price_per_kilo

#     # method to describe the fruit
#     def describe(self) -> None:
#         print(f'{self.grams}g of {self.name} costs ${self.total_price}')

# # main block
# def main() -> None:
#     # creating fruit instances
#     apple: Fruit= Fruit('Apple', 1500, 5) 
#     orange: Fruit= Fruit('Orange', 2500, 10)
        
#     # printing fruit objects
#     print(apple)  #Output: Fruit(name='Apple', grams=1500, price_per_kilo=5, total_price=7.5)
#     print(orange) # Output: Fruit(name='Orange', grams=2500, price_per_kilo=10, total_price=25.0)


#     # using describe method
#     apple.describe() #Output: 1500g of Apple costs $7.5
#     orange.describe() #Output: 2500g of Orange costs $25.0

#     # attempting to change the price per kilo
#     apple.price_per_kilo = 100 #Changes will not take effect (Post_initializer only runs once)
#     apple.describe()


# if __name__ == '__main__':
#      main()

#-----------------------------------------------------------------
# INITVAR (InitVar)       
# from dataclasses import dataclass, field, InitVar

# # Creating the Fruit data class
# @dataclass
# class Fruit:
#     name: str                # Fruit name
#     grams: float             # Weight in grams
#     price_per_kilo: float    # Price per kilogram
#     is_rare: InitVar[bool | None] = None  # Init-only variable
#     total_price: float = field(init=False)  # Total price, computed later
    
#     def __post_init__(self, is_rare: bool | None) -> None:
        
#         # Double price if the fruit is rare
#         if is_rare:
#             self.price_per_kilo *= 2

#         # Calculate total price
#         self.total_price = (self.grams / 1000) * self.price_per_kilo
    

#     def describe(self):
#         # Displaying fruit details
#         print(f'{self.grams}g of {self.name} costs ${self.total_price}.')


# # Main section to demonstrate functionality
# def main() -> None:
#     # Creating fruit instances
#     apple: Fruit = Fruit('Apple', 1500, 5) 
#     orange: Fruit = Fruit('Orange', 2500, 10) 
#     passion: Fruit = Fruit('Passion Fruit', 100, 50, is_rare=True) 

#     # Describing the fruits
#     apple.describe() #Output: 1500g of Apple costs $7.50.
#     orange.describe() #Output: 2500g of Orange costs $25.00.
#     passion.describe() #Output: 100g of Passion Fruit costs $10.00.

#     # Displaying the fruit objects
#     print(apple)
#     print(orange)
#     print(passion) #Output: None (declared as an init variable)

# if __name__ == '__main__':
#       main()


#-----------------------------------------------------------------
# PROPERTY (@property) 
# from dataclasses import dataclass, field, InitVar

# # Creating the Fruit data class
# @dataclass
# class Fruit:
#     name: str                # Fruit name
#     grams: float             # Weight in grams
#     price_per_kilo: float    # Price per kilogram
#   ######
#   #ADDING PROPERTY: Keeps information up-to-date
#     @property
#     def total_price(self) -> float:
#          return(self.grams / 1000) * self.price_per_kilo
#     ######

#     def describe(self):
#         # Displaying fruit details
#         print(f'{self.grams}g of {self.name} costs ${self.total_price}.')

# # Main section to demonstrate functionality
# def main() -> None:
#     # Creating fruit instances
#     apple: Fruit = Fruit('Apple', 1500, 5) 
#     print(apple) 
#             #Output: Fruit(name='Apple', grams=1500, price_per_kilo=5)
#     apple.describe()
#             #Output: 1500g of Apple costs $7.5.
#     apple.price_per_kilo=20 #updating price
#     print(apple)
#             #Output: Fruit(name='Apple', grams=1500, price_per_kilo=20)
#     apple.describe()
#             #Output: 1500g of Apple costs $30.0.

# if __name__ == '__main__':
#       main()


#-----------------------------------------------------------------      