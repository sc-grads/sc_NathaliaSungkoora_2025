#IF STATEMENTS
#TESTING:
day_of_week = input("What day of the week is it today? ")
print (day_of_week == "Monday") #Output= True

day_of_week = input("What day of the week is it today? ")

if day_of_week == "Monday":
    print("Have a great start to your week!")
elif day_of_week == "Friday":
    print("It's ok to finish a bit early!")
else:
    print("Full speed ahead!")


#Add .lower() to help if user input varies

day_of_week = input("What day of the week is it today? ").lower()

if day_of_week == "monday":
    print("Have a great start to your week!")
elif day_of_week == "friday":
    print("It's ok to finish a bit early!")
else:
    print("Full speed ahead!")