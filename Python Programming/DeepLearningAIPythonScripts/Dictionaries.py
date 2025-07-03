# Prioritizing tasks with dictionaries and AI
# Explore dictionaries, a data structure that helps you store key-value pairs.
# The main difference with list, is that dictionaries assign a key to each value instead of an index.

from helper_functions import print_llm_response, get_llm_response

# If you wanted to store ice cream flavor descriptions using lists, you would have something like this:
ice_cream_flavors_list = [
    "Vanilla: Classic and creamy with a rich, smooth flavor from real vanilla beans.",
    "Chocolate: Deep and indulgent, made with rich cocoa for a satisfying chocolate experience.",
    "Strawberry: Sweet and fruity, bursting with the fresh taste of ripe strawberries.",
    "Mint Chocolate Chip: Refreshing mint ice cream studded with decadent chocolate chips.",
    "Cookie Dough: Vanilla ice cream loaded with chunks of chocolate chip cookie dough.",
    "Salted Caramel: Sweet and salty with a smooth caramel swirl and a hint of sea salt.",
    "Pistachio: Nutty and creamy, featuring the distinct taste of real pistachios.",
    "Cookies and Cream: Vanilla ice cream packed with chunks of chocolate sandwich cookies.",
    "Mango: Tropical and tangy, made with juicy mangoes for a refreshing treat.",
    "Rocky Road: Chocolate ice cream mixed with marshmallows, nuts, and chocolate chunks."
]

# If you wanted to look up the description for a particular flavor, you would have to memorize its index.

# Now using dictionaries instead of lists:
ice_cream_flavors_dict = {
    "Mint Chocolate Chip": "Refreshing mint ice cream studded with decadent chocolate chips.",
    "Cookie Dough": "Vanilla ice cream loaded with chunks of chocolate chip cookie dough.",
    "Salted Caramel": "Sweet and salty with a smooth caramel swirl and a hint of sea salt."
}

# Output = list of dictionary keys
print(ice_cream_flavors_dict.keys())
# Output = dict_keys(['Mint Chocolate Chip', 'Cookie Dough', 'Salted Caramel'])

# Output = list of dictionary values
print(ice_cream_flavors_dict.values())
# Output = dict_values(['Refreshing mint ice cream studded with decadent chocolate chips.',
#                       'Vanilla ice cream loaded with chunks of chocolate chip cookie dough.',
#                       'Sweet and salty with a smooth caramel swirl and a hint of sea salt.'])

#-------------------------------------------------------------------------------
#ACCESSING ELEMENTS IN A DICTIONARY
# Wrong way of accessing elements (treating dict as a list)
# This will cause an error because 0 is not a valid key
# print(ice_cream_flavors_dict[0])
# Output = KeyError: 0

# Correct way to access a value using its key:
cookie_dough_description = ice_cream_flavors_dict["Cookie Dough"]
print(cookie_dough_description)
# Output = Vanilla ice cream loaded with chunks of chocolate chip cookie dough.

# Adding a new item to the dictionary
ice_cream_flavors_dict["Rocky Road"] = "Chocolate ice cream mixd witother ngredients."
print(ice_cream_flavors_dict)
# Output = {'Mint Chocolate Chip': 'Refreshing mint ice cream studded with decadent chocolate chips.',
#           'Cookie Dough': 'Vanilla ice cream loaded with chunks of chocolate chip cookie dough.',
#           'Salted Caramel': 'Sweet and salty with a smooth caramel swirl and a hint of sea salt.',
#           'Rocky Road': 'Chocolate ice cream mixd witother ngredients.'}

# Fixing the typo in the Rocky Road description
ice_cream_flavors_dict["Rocky Road"] = "Chocolate ice cream mixed with other ingredients."
print(ice_cream_flavors_dict)
# Output = {'Mint Chocolate Chip': 'Refreshing mint ice cream studded with decadent chocolate chips.',
#           'Cookie Dough': 'Vanilla ice cream loaded with chunks of chocolate chip cookie dough.',
#           'Salted Caramel': 'Sweet and salty with a smooth caramel swirl and a hint of sea salt.',
#           'Rocky Road': 'Chocolate ice cream mixed with other ingredients.'}
#-------------------------------------------------------------------------------

#DIFFERENT TYPRES OF ELEMENTS IN DICTIONARIES
# Different types of elements can be stored in dictionaries:
isabel_facts = {
    "age": 28,
    "Favorite color": "red"
}
print(isabel_facts)
# Output = {'age': 28, 'Favorite color': 'red'}

# Adding a list to a dictionary
isabel_facts["Cat names"] = ["Charlie", "Smokey", "Tabitha"]
print(isabel_facts)
# Output = {'age': 28, 'Favorite color': 'red', 'Cat names': ['Charlie', 'Smokey', 'Tabitha']}

# Adding another list
isabel_facts["Favorite Snacks"] = ["pineapple cake", "candy"]
print(isabel_facts)
# Output = {'age': 28, 'Favorite color': 'red',
#  'Cat names': ['Charlie', 'Smokey', 'Tabitha'], 'Favorite Snacks': ['pineapple cake', 'candy']}


#---------------------------------------------------------------------------------

# USING DICTIONARIES IN PROMPTS
# Using a dictionary to create a prompt for an AI model

# Using dictionaries to complete high priority tasks using AI

# Original unorganized task list (not used in code, for reference only)
list_of_tasks = [
    "Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.",
    "Write a birthday poem for Otto, celebrating his 28th birthday.",
    "Write a 300-word review of the movie 'The Arrival'.",
    "Draft a thank-you note for my neighbor Dapinder who helped water my plants while I was on vacation.",
    "Create an outline for a presentation on the benefits of remote work."
]

# Dividing tasks by priority
high_priority_tasks = [
    "Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.",
    "Create an outline for a presentation on the benefits of remote work."
]
medium_priority_tasks = [
    "Write a birthday poem for Otto, celebrating his 28th birthday.",
    "Draft a thank-you note for my neighbor Dapinder who helped water my plants while I was on vacation."
]
low_priority_tasks = [
    "Write a 300-word review of the movie 'The Arrival'."
]

# Create dictionary with all tasks categorized by priority
prioritized_tasks = {
    "high_priority": high_priority_tasks,
    "medium_priority": medium_priority_tasks,
    "low_priority": low_priority_tasks
}

print(prioritized_tasks)
# Output = {'high_priority': [...], 'medium_priority': [...], 'low_priority': [...]}

# View just high priority tasks
print(prioritized_tasks["high_priority"])
# Output = ["Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.",
#            'Create an outline for a presentation on the benefits of remote work.']

# Complete medium priority tasks using AI
for task in prioritized_tasks["medium_priority"]:
    print_llm_response(task)
# Output = AI-generated responses for the birthday poem and thank-you note
#-------------------------------------------------------------------------------------------------

#EXTRA PRACTICE

from helper_functions import print_llm_response, get_llm_response

# Existing dictionary from previous lesson (make sure it's defined)
ice_cream_flavors = {
    "Mint Chocolate Chip": "Refreshing mint ice cream studded with decadent chocolate chips.",
    "Cookie Dough": "Vanilla ice cream loaded with chunks of chocolate chip cookie dough.",
    "Salted Caramel": "Sweet and salty with a smooth caramel swirl and a hint of sea salt.",
    "Rocky Road": "Chocolate ice cream mixed with other ingredients."  # initial description
}

# Extra practice 1: Update Rocky Road description using get_llm_response()
flavor = "Rocky Road"
prompt = f"Provide a brief description for the {flavor} ice cream flavor"

description = get_llm_response(prompt)
ice_cream_flavors["Rocky Road"] = description
print(description)
# Expected output example:
# Rocky Road ice cream is a classic flavor that typically 
# consists of chocolate ice cream with marshmallows and nuts, usually almonds.

# Existing prioritized_tasks dictionary (make sure it's defined)
prioritized_tasks = {
    "high_priority": [
        "Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.",
        "Create an outline for a presentation on the benefits of remote work."
    ],
    "medium_priority": [
        "Write a birthday poem for Otto, celebrating his 28th birthday.",
        "Draft a thank-you note for my neighbor Dapinder who helped water my plants while I was on vacation."
    ],
    "low_priority": [
        "Write a 300-word review of the movie 'The Arrival'."
    ]
}
# Extra practice 2: Complete medium priority tasks using AI
for task in prioritized_tasks["medium_priority"]:
    print_llm_response(task)
# Expected output: AI-generated responses for the birthday poem and thank-you note