# LESSON 6 - HELPING AI MAKE DECISIONS

from helper_functions import print_llm_response

# TASK LIST WITH TIME TO COMPLETE
# Each task is a dictionary with description and time_to_complete (minutes)
task_list = [
    {
        "description": "Compose a brief email to my boss explaining that I will be late for next week's meeting.",
        "time_to_complete": 3
    },
    {
        "description": "Create an outline for a presentation on the benefits of remote work.",
        "time_to_complete": 60
    },
    {
        "description": "Write a 300-word review of the movie 'The Arrival'.",
        "time_to_complete": 30
    },
    {
        "description": "Create a shopping list for tofu and olive stir fry.",
        "time_to_complete": 5
    }
]

# ACCESS FIRST TASK AND PRINT
task = task_list[0]
print(task)  
# Output: {'description': "Compose a brief email to my boss explaining that I will be late for next week's meeting.", 'time_to_complete': 3}

# CHECK IF FIRST TASK TAKES AT MOST 5 MINUTES
print(task["time_to_complete"] <= 5)  # Output: True

# IF STATEMENT TO COMPLETE TASKS TAKING 5 MINUTES OR LESS
if task["time_to_complete"] <= 5:
    task_to_do = task["description"]
    print_llm_response(task_to_do)
# Expected output from print_llm_response:
# ____________________________________________________________________________________________________
# Subject: Running Late for Next Week's Meeting
#
# Hi [Boss's Name],
#
# I wanted to let you know that I will be running late for next week's meeting. I apologize for any inconvenience this may cause. Please let me know if there is anything I can do to prepare in advance.
#
# Thank you for your understanding.
#
# Best,
# [Your Name]
# ____________________________________________________________________________________________________

# TRY THE SAME FOR SECOND TASK
task = task_list[1]
if task["time_to_complete"] <= 5:
    task_to_do = task["description"]
    print_llm_response(task_to_do)
print(task["time_to_complete"] <= 5)  # Output: False

# TRY FOR THIRD AND FOURTH TASKS
task = task_list[2]
if task["time_to_complete"] <= 5:
    task_to_do = task["description"]
    print_llm_response(task_to_do)

task = task_list[3]
if task["time_to_complete"] <= 5:
    task_to_do = task["description"]
    print_llm_response(task_to_do)
# Expected output for fourth task from print_llm_response:
# ____________________________________________________________________________________________________
# 1. Tofu
# 2. Olive oil
# 3. Soy sauce
# 4. Garlic
# 5. Ginger
# 6. Bell peppers
# 7. Broccoli
# 8. Carrots
# 9. Green onions
# 10. Rice
# ____________________________________________________________________________________________________

#-----------------------------------------------------------
# LESSON 6 - HELPING AI MAKE DECISIONS

from helper_functions import print_llm_response

# TASK LIST DEFINITION
task_list = [
    {
        "description": "Compose a brief email to my boss explaining that I will be late for next week's meeting.",
        "time_to_complete": 3
    },
    {
        "description": "Create an outline for a presentation on the benefits of remote work.",
        "time_to_complete": 60
    },
    {
        "description": "Write a 300-word review of the movie 'The Arrival'.",
        "time_to_complete": 30
    },
    {
        "description": "Create a shopping list for tofu and olive stir fry.",
        "time_to_complete": 5
    }
]

# LOOPING THROUGH THE TASK LIST
# Iterate over all tasks and complete those that take 5 minutes or less
for task in task_list:
    if task["time_to_complete"] <= 5:
        task_to_do = task["description"]
        print_llm_response(task_to_do)

# Expected output snippets from print_llm_response for tasks under 5 minutes:

# ____________________________________________________________________________________________________
# Subject: Late Arrival for Next Week's Meeting
#
# Hi [Boss's Name],
#
# I wanted to inform you that I will be arriving late to next week's meeting due to a prior commitment. I apologize for any inconvenience this may cause and will make sure to catch up on any missed information upon my arrival.
#
# Thank you for your understanding.
#
# Best regards,
# [Your Name]
# ____________________________________________________________________________________________________

# ____________________________________________________________________________________________________
# 1. Tofu
# 2. Olives
# 3. Vegetables (such as bell peppers, broccoli, and carrots)
# 4. Soy sauce
# 5. Olive oil
# 6. Garlic
# 7. Ginger
# 8. Cornstarch
# 9. Rice (for serving)
# 10. Optional: sesame seeds or green onions for garnish
# ____________________________________________________________________________________________________

#-----------------------------------------------------------
# HELPING AI MAKE DECISIONS

from helper_functions import print_llm_response

# TASK LIST DEFINITION
task_list = [
    {
        "description": "Compose a brief email to my boss explaining that I will be late for next week's meeting.",
        "time_to_complete": 3
    },
    {
        "description": "Create an outline for a presentation on the benefits of remote work.",
        "time_to_complete": 60
    },
    {
        "description": "Write a 300-word review of the movie 'The Arrival'.",
        "time_to_complete": 30
    },
    {
        "description": "Create a shopping list for tofu and olive stir fry.",
        "time_to_complete": 5
    }
]

# IF-ELSE BLOCK TO HANDLE TASKS BASED ON TIME
for task in task_list:
    if task["time_to_complete"] <= 5:
        task_to_do = task["description"]
        print_llm_response(task_to_do)
    else:
        task_to_do = task["description"]
        print(f"To complete later: {task_to_do} Takes {task['time_to_complete']} time to complete.")

# Sample output :

# ____________________________________________________________________________________________________
# Subject: Late Arrival for Next Week's Meeting
#
# Hi [Boss's Name],
#
# I wanted to inform you that I will be arriving late for next week's meeting due to a prior commitment. I apologize for any inconvenience this may cause and will make sure to catch up on any missed information upon my arrival.
#
# Thank you for your understanding.
#
# Best regards,
# [Your Name]
# ____________________________________________________________________________________________________

# To complete later: Create an outline for a presentation on the benefits of remote work.
#  Takes 60 time to complete.
# To complete later: Write a 300-word review of the movie 'The Arrival'. 
# Takes 30 time to complete.
# ____________________________________________________________________________________________________
# 1. Tofu
# 2. Olives
# 3. Vegetables (such as bell peppers, broccoli, and carrots)
# 4. Soy sauce
# 5. Olive oil
# 6. Garlic
# 7. Ginger
# 8. Cornstarch
# 9. Rice (for serving)
# 10. Optional: sesame seeds or green onions for garnish
# ____________________________________________________________________________________________________

#-----------------------------------------------------------
# SAVING TASKS FOR LATER USING LISTS

from helper_functions import print_llm_response

# Initialize a list of tasks
task_list = [
    {
        "description": "Compose a brief email to my boss explaining that I will be late for next week's meeting.",
        "time_to_complete": 3
    },
    {
        "description": "Create an outline for a presentation on the benefits of remote work.",
        "time_to_complete": 60
    },
    {
        "description": "Write a 300-word review of the movie 'The Arrival'.",
        "time_to_complete": 30
    },
    {
        "description": "Create a shopping list for tofu and olive stir fry.",
        "time_to_complete": 5
    }
]

# Create an empty list to save tasks that will be completed later
tasks_for_later = []

# Loop through tasks
for task in task_list:
    if task["time_to_complete"] <= 5:
        task_to_do = task["description"]
        print_llm_response(task_to_do)
      
    else:
        tasks_for_later.append(task)

# Print the tasks saved for later
print(tasks_for_later)
# Outputs:

#Takes completed:
  # Example output (automated email):
        # Subject: Late Arrival for Next Week's Meeting
        #
        # Hi [Boss's Name],
        #
        # I wanted to inform you that I will be arriving late for next week's meeting due to a prior commitment.
        # I apologize for any inconvenience this may cause.
        #
        # Best regards,
        # [Your Name]

        # Example output (shopping list):
        # 1. Tofu
        # 2. Olives
        # 3. Vegetables (such as bell peppers, broccoli, and carrots)
        # 4. Soy sauce
        # 5. Olive oil
        # 6. Garlic
        # 7. Ginger
        # 8. Cornstarch
        # 9. Rice
        # 10. Green onions

#Tasks saved for later:
# [{'description': 'Create an outline for a presentation on the benefits of remote work.', 'time_to_complete': 60},
#  {'description': "Write a 300-word review of the movie 'The Arrival'.", 'time_to_complete': 30}]

#-----------------------------------------------------------
#EXTRA PRACTICE

# Modify this code to complete the task 
# if it takes more than 15 minutes

task = task_list[2]

### EDIT THE FOLLOWING CODE ###
if task["time_to_complete"] >15: #Modify this line
    task_to_do = task["description"]
    print_llm_response(task_to_do)
#OUTPUT: 
# The Arrival" is a captivating science fiction film that delves into the complexities of 
# communication and the consequences of human actions. Directed by Denis Villeneuve, the movie 
# follows linguist Louise Banks, played brilliantly by Amy Adams, as she is tasked with deciphering 
# the language of extraterrestrial visitors who have arrived on Earth.


#----------------------------------
# Fix the code here by only using indentation.
# It should print a message if the "Chocolate" ice cream flavor 
# is located in the ice_cream_flavors list.

ice_cream_flavors = [
    "Vanilla", "Strawberry", "Mint Chocolate Chip",
    "Cookies and Cream", "Rocky Road", "Butter Pecan",
    "Pistachio", "Salted Caramel", "Chocolate",
    "Mango"
]

### EDIT THE FOLLOWING CODE ### 
#Hint: Recall that the code within for loops 
# and if statements is indented. The convention
# in Python is to add four spaces for indented code.
for flavor in ice_cream_flavors:
    if flavor == "Chocolate":
        print(f"The list of flavors contains {flavor}, Andrew's favorite.")
#OUTPUT: The list of flavors contains Chocolate, Andrew's favorite.

#---------------------------------
# Add variables to the f-string to provide the
# task description as well as the time to complete 
# for the tasks that are left for later.

for task in task_list:
    if task["time_to_complete"] <= 5:
        task_to_do = task["description"]
        print_llm_response(task_to_do) 
    else:
        ### EDIT THE FOLLOWING CODE ###
        # Hint: To add a variable in an f-string
        # you need to use the following syntax: {variable_name}. 
        print(f"To complete later:{task_to_do}") 
        ### ---------------  ###