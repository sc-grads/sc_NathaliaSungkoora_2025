# DICTIONARY COMPREHENSION


#Example where each user info is stored in a tuple
users = [
    (0, "Bob", "password"),
    (1, "Rolf", "bob123"),
    (2, "Jose", "longp4assword"),
    (3, "username", "1234"),
]

username_mapping = {user[1]: user for user in users}
userid_mapping = {user[0]: user for user in users}

print(username_mapping)
# OUTPUT = {'Bob': (0, 'Bob', 'password'), 'Rolf': (1, 'Rolf', 'bob123'), 'Jose': (2, 'Jose', 'longp4assword'), 'username': (3, 'username', '1234')}

#Getting specific user infor
print(username_mapping["Bob"])  # OUTPUT = (0, "Bob", "password")

# EXAMPLE: can be USEFUL as a LOG IN

username_input = input("Enter your username: ")
password_input = input("Enter your password: ")

_, username, password = username_mapping[username_input]

if password_input == password:
    print("Your details are correct!")
else:
    print("Your details are incorrect.")


    #Example of Output:
    # Enter your username: Bob
    # Enter your password: password
    # Your details are correct!