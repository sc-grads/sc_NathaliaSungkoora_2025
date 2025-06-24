# LAMBDA FUNCTIONS

#Using LAMBDA KEYWORD
def add(x, y):
    return x + y

print(add(5, 7)) #OUTPUT = 12

add = lambda x, y: x + y
print(add(5,7)) #OUTPUT = 12



#LAMBDAS EXAMPLES (MAP)
def double(x):
    return x * 2


sequence = [1, 3, 5, 9]

doubled = [double(x) for x in sequence]
doubled = map(double, sequence)
print(list(doubled))


#Example Written using LAMBDA
sequence = [1, 3, 5, 9]

doubled = map(lambda x: x * 2, sequence)
print(list(doubled))  #OUTPUT = [2, 6, 10, 18]
