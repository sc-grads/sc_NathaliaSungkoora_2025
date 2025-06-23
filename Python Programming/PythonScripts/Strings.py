#STRINGS

name = "Bob"
greeting = "Hello, Bob"

print(greeting) #Hello, Bob
# prints greeting value

name = "Rolf"

print(greeting)
# greeting not updated yet

greeting = f"Hello, {name}" #referencing variable to be dynamic
print(greeting)
# dynamic greeting with updated name


#Examples:

name = "Bob"
print(f"Hello, {name}") #Hello, Bob
# dynamic greeting with Bob

name = "Rolf"
print(f"Hello, {name}") #Hello, Rolf
# dynamic greeting with Rolf

#Using String Templates
#Helps define template to be reused
name= "Bob"
greeting = "Hello, {}"
with_name = greeting.format(name)
print(with_name) #Hello, Bob
# using template to insert name

#Another example: 
greeting = "Hello, {}"
with_name = greeting.format("Rolf")
print(with_name) #Hello, Rolf
# template with direct value

#Using format to create longer strings
longer_phrase = "Hello, {}. Today is {}."
formatted = longer_phrase.format("Rolf", "Monday") #embeds values within a string
print(formatted) #Hello, Rolf. Today is Monday.
# template with multiple values


# More Examples
name = 'Bob'
my_string = f'Hello {name}!'
name = 'Rolf'
print(my_string) #Hello Bob!