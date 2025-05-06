#SECTION: 5 ERRORS

#User Input

#import sys
#total: int = 0
#while True:
    #user_input: str = input('Enter a number: ')

    #if user_input == '0': #Exit program as soon as '0' is entered
        #print('Total:', total)
        #sys.exit()

    #total += int   (user_input) 
#--------------------------------------------------------------------
#Shortcut(Rename)

def get_stats(f_name: str)-> None:
    print(f'{f_name} is a good name!')
    print(f'{f_name} is {len(f_name)} characters long.')
    print(f'{f_name} in uppercase is {f_name.upper()}')

get_stats('James')