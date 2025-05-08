#UdemyPythonSection9OOPInPython

#class containes blueprint for how something should look like

# Car class demonstration using Object-Oriented Programming in Python

class Car:
    # Initialize: set up the car's basic properties
    def __init__(self, brand: str, wheels: int) -> None:
        self.brand = brand  # Car brand
        self.wheels = wheels  # Number of wheels

    # Method to turn on the car
    def turn_on(self) -> None:
        print(f'Turning on: {self.brand}')

    # Method to turn off the car
    def turn_off(self) -> None:
        print(f'Turning off: {self.brand}')

    # Method to drive the car for a specified distance
    def drive(self, km: float) -> None:
        print(f'Driving {self.brand} for {km} km')

    # Method to describe the car
    def describe(self) -> None:
        print(f'{self.brand} is a car with {self.wheels} wheels')

# Main entry point of the program
if __name__ == '__main__':
    # Creating a BMW car object
    bmw: Car = Car('BMW', 4)

    # Demonstrating the functionality of the BMW object
    bmw.turn_on()
    bmw.drive(10)
    bmw.turn_off()
    bmw.describe()

    # Creating another car - a Volvo with six wheels
    volvo = Car('Volvo', 6)

    # Demonstrating the functionality of the Volvo object
    volvo.turn_on()
    volvo.drive(30)
    volvo.turn_off()
    volvo.describe()
