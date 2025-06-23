#FIRST PYTHON APP
user_age = input("Enter your age: ")
age_number = int(user_age) #change data type to be INT

months = age_number * 12
print(f"{age_number} is equal to {months} months.") #Printing in a more readable way
#Output= 30 is equal to 360 months.

#Can also define data type as INT 
user_age = int(input("Enter your age: "))
months = user_age* 12
print(f"{user_age} is equal to {months} months.") #Printing in a more readable way
#Same Output (less code)= 30 is equal to 360 months.
