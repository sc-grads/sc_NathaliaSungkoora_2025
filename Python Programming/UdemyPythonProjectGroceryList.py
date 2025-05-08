#GroceryList project

#---------------------------------------------------------

import sys

# Function to display the welcome message
def welcome_message() -> None:
    print('Welcome to Groceries!')
    print('Enter:')
    print('--------------------------')
    print('1 - To add an item')
    print('2 - To remove an item')
    print('3 - To list all items')
    print('0 - To exit the program')
    print('--------------------------')

# Function to add an item to the list
def add_item(item: str, groceries: list[str]) -> None:
    groceries.append(item)
    print(f'"{item}" has been added!')

# Function to remove an item from the list
def remove_item(item: str, groceries: list[str]) -> None:
    if not groceries:
        print('Your list is empty.')
        return

    try:
        groceries.remove(item)
        print(f'"{item}" has been removed.')
    except ValueError:
        print(f'No "{item}" found in: {groceries}')

# Function to display the current list
def display_groceries(groceries: list[str]) -> None:
    if not groceries:
        print('Your list is empty.')
        return

    print('___LIST___')
    for i, item in enumerate(groceries, 1):  # Groups list in order
        print(f'{i}. {item.capitalize()}')
    print('_' * 10)

# Function to check if an option is valid
def is_an_option(text: str) -> bool:
    return text in ['1', '2', '3', '0']

# Main function
def main():
    groceries: list[str] = []  # Initialize an empty list
    welcome_message()

    while True:
        user_input = input('Choose: ').lower()

        if not is_an_option(user_input):
            print('Please pick a valid option.')
            continue

        if user_input == '1':
            new_item = input('What item would you like to add? >> ').lower()
            add_item(new_item, groceries)

        elif user_input == '2':
            item_to_remove = input('What item would you like to remove? ').lower()
            remove_item(item_to_remove, groceries)

        elif user_input == '3':
            display_groceries(groceries)

        elif user_input == '0':
            print('Exiting the program...')
            sys.exit()

if __name__ == '__main__':
    main()

