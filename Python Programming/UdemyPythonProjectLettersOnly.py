#LETTERS ONLY PROJECT (SECTION 5)

import string

# Function to check if input contains only letters
def is_letters_only(text: str) -> None:
    alphabet:str =  string.ascii_letters + ' '
    
    
    for char in text:
        if char not in alphabet:
            raise ValueError('Text can only contain letters from the alphabet.')


    print (f'"{text}" is letters-only, good job!')

# Main function
def main() -> None:
    while True:
        try:
            user_input: str = input('Check text: ')
            is_letters_only(user_input)

        except ValueError as ve:
            print(f'Please only enter English letters...')

        except Exception as e:
             print('Encountered an unknown exception: {type(e)} {e} ')
       
# Run the program

    main()



