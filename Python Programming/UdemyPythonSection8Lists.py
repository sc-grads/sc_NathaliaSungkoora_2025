# SECTION 8: LISTS

#------------------------------------------------------------

# LIST COMPREHENSION
# Writing simpler code:

#numbers: list[int] = [1,2,3]

#doubled_lc: list[int] = [number * 2 for number in numbers]
#print(doubled_lc) # Output: [2, 4, 6]

#Another lc example:
#names: list[str] = ['Mario', 'James', 'Luigi', 'John']

#j_names_lc: list[str] = [name for name in names if name.startswith('J')]
                            #Syntax for loop 
#print(j_names_lc) # Output:['James', 'John']     
# 
# 
# Another Example2:
#numbers: list[int] = [1,2,4, 6,7,10]

#even_numbers_lc: list[int]=[number 
                            #for number in numbers if number %2==0]

#print(even_numbers_lc)  # Output: [2, 4, 6, 10]


#---------------------------------------
#SLICING

#numbers: list[int] = [1,2,3,4,5,6]
#print(numbers[:3] + numbers[3:]) # Output: [1, 2, 3, 4, 5, 6]
        # everything [:3] before 3
        # everything [:3] after 3
#print(numbers[-1])   # Output: 6 (getting last element from list) 

#defining steps:
#print(numbers[0:4:2]) # Output:[1, 3]
#print(numbers[4:0:-2]) # Output:[5, 3] #doing things backwards
#print(numbers[::2]) # Output:[1, 3, 5] #stepping with all numbers

#----------------------------------------
#DONT LOOP AND MODIFY

people: list[str] = ['Anna', 'Bob', 'Chris', 'David', 'Fred']
new_people: list[str] =[]

for person in people:
    print(f'-{person}, {people.index(person)}')

    if person =='Bob':
        print(f'Removing: {person}')
        continue

    new_people.append(person)
    
print(new_people)    