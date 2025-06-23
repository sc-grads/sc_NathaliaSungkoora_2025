#LOOPS

#WHILE LOOP

number = 7
play = input("Would you like to play? (Y/n) ")

while play != "n":
    user_number = int(input("Guess our number: "))
    if user_number == number:
        print("You guessed correctly!")
    elif abs(number - user_number) == 1:
        print("You were off by 1.")
    else:
        print("Sorry, it's wrong!")

    play = input("Would you like to play? (Y/n) ")


# ADD BREAK KEYWORD TO EXIT LOOP

while True:
    play = input("Would you like to play? (Y/n) ")

    if play == "n":
        break  # Adding a break to EXIT the loop

    user_number = int(input("Guess our number: "))
    if user_number == number:
        print("You guessed correctly!")
    elif abs(number - user_number) == 1:
        print("You were off by 1.")
    else:
        print("Sorry, it's wrong!")


#FOR LOOP

friends = ["Rolf", "Jen", "Bob", "Anne"]
for friend in friends:
    print(f"{friend} is my friend.")
    #Output = Rolf is my friend. Jen is my friend. Bob is my friend. Anne is my friend.

#Alternatively can use range to show number of times it repeats

friends = ["Rolf", "Jen", "Bob", "Anne"]
for friend in range(4):
    print(f"{friend} is my friend.")
#Output: 0 is my friend. 1 is my friend. 2 is my friend. 3 is my friend.



#FOR LOOP: AVERAGE

grades = [35, 67, 98, 100, 100]
total = 0
amount = len(grades)

for grade in grades:
    total += grade #or written as total = total + grade

print(total / amount) #Output= 80.0

#SUM Function to do the same thing

grades = [35, 67, 98, 100, 100]
total = sum(grades)
amount = len(grades)

print(total / amount) #Output= 80.0

