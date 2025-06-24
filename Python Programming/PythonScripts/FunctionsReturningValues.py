# FUNCTIONS RETURNING VALUES

def add(x, y):
    print(x + y)


add(5, 8)  # OUTPUT= 13
result = add(5, 8) # OUTPUT=13
print(result)  # OUTPUT= None

#Adding RETURN
def add(x, y):
    return x + y

add(5, 8)
result = add(5, 8)
print(result) # OUTPUT=13

#EXAMPLE OF USING PRINT AND RETURN

def add(x, y):
    print (x + y)
    return x + y
result = add(5,8)
print(result) # OUTPUT=13 twice (for print and return)


#Returning with CONDITIONS


def divide(dividend, divisor):
    if divisor != 0:
        return dividend / divisor
    else:
        return "You fool!"


result = divide(15, 3)
print(result)  # OUTPUT= 5

another = divide(15, 0)
print(another)  # # OUTPUT= You fool!

