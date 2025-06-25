#ERRORS IN PYTHON

def divide(dividend, divisor):
    if divisor == 0:
        raise ZeroDivisionError("Divisor cannot be 0.")

    return dividend / divisor

divide(15,0) #OUTPUT ERROR: ZeroDivisionError: Divisor cannot be 0.


#ANOTHER EXAMPLE:
#ADDING ERROR IN TRY AND EXCEPT
def divide(dividend, divisor):
    if divisor == 0:
        raise ZeroDivisionError("Divisor cannot be 0.")

    return dividend / divisor


grades = []

try:
    average = divide(sum(grades), len(grades))
    print(average)
except ZeroDivisionError as e:
    print(e)
    print("There are no grades yet in your list.")

    # OUTPUT:
    # Divisor cannot be 0.
    # There are no grades yet in your list.

#DIFFERENT ERROR TYPES:
# TypeError: something was the wrong type
# ValueError: something had the wrong value
# RuntimeError: most other things

# EXAMPLE IF NO ERROR WAS RAISED
grades = [90, 100, 85]

try:
    average = divide(sum(grades), len(grades))
except ZeroDivisionError:
    print("There are no grades yet in your list.")
else:
    print(f"The average was {average}")


#EXAMPLE USING STUDENT GRADES

students = [
    {"name": "Bob", "grades": [75, 90]},
    {"name": "Rolf", "grades": []},
    {"name": "Jen", "grades": [100, 90]},
]

try:
    for student in students:
        name = student["name"]
        grades = student["grades"]
        average = divide(sum(grades), len(grades))
        print(f"{name} averaged {average}.")
except ZeroDivisionError:
    print(f"ERROR: {name} has no grades!")
else:
    print("-- All student averages calculated --")
finally:
    print("-- End of student average calculation --")

    #OUTPUT(STUDENT GRADES EXAMPLE):
    # Bob averaged 82.5
    # ERROR: Rolf has no grades!
    # -- End of student average calculation --