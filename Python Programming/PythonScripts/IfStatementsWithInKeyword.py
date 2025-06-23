

#MAGIC NUMBER APP
number = 7
user_input = input("Enter 'y' if you would like to play: ")

if user_input in ("y", "Y"): #create a tuple for user-input
    user_number = int(input("Guess our number: "))
    if user_number == number:
        print("You guessed correctly!")
    elif number - user_number in (1, -1):
        print("You were off by 1.")
    else:
        print("Sorry, it's wrong!")

#Alternatively add .lower():
number = 7
user_input = input("Enter 'y' if you would like to play: ").lower()

if user_input in "y":
    user_number = int(input("Guess our number: "))
    if user_number == number:
        print("You guessed correctly!")
    elif number - user_number in (1, -1):
        print("You were off by 1.")
    else:
        print("Sorry, it's wrong!")


#Adding absolute (abs())
number = 7
user_input = input("Enter 'y' if you would like to play: ")

if user_input.lower() == "y":
    user_number = int(input("Guess our number: "))
    if user_number == number:
        print("You guessed correctly!")
    elif abs(number - user_number) == 1:
        print("You were off by 1.")
    else:
        print("Sorry, it's wrong!")