#FOR LOOP IN LISTS

# List of tasks
list_of_tasks = [
    "Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.",
    "Write a birthday poem for Otto, celebrating his 28th birthday.",
    "Write a 300-word review of the movie 'The Arrival'."
]

# Loop to print each task
for task in list_of_tasks:
    print(task)

# Loop to send each task to the AI and print the response
for task in list_of_tasks:
    print_llm_response(task)



from helper_functions import print_llm_response, get_llm_response

# --- LESSON 2: Repeating tasks with for loops ---

# List of tasks from previous lesson
list_of_tasks = [
    "Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.",
    "Write a birthday poem for Otto, celebrating his 28th birthday.",
    "Write a 300-word review of the movie 'The Arrival'."
]

print(list_of_tasks)
# Output: ["Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.", 
# 'Write a birthday poem for Otto, celebrating his 28th birthday.', 
# "Write a 300-word review of the movie 'The Arrival'."]

# Passing each task one by one (repetitive)
task = list_of_tasks[0]
print_llm_response(task)
# Output: (email text)

# Using a for loop to print all tasks
for task in list_of_tasks:
    print(task)
# Output:
# Compose a brief email to my boss explaining that I will be late for tomorrow's meeting.
# Write a birthday poem for Otto, celebrating his 28th birthday.
# Write a 300-word review of the movie 'The Arrival'.

# Using for loop to send all tasks to LLM
for task in list_of_tasks:
    print_llm_response(task)
# Output: LLM responses for all tasks printed sequentially

# Explanation:
# - 'for task in list_of_tasks:' assigns each task one by one to 'task'
# - Indented block runs print_llm_response(task)
# - ':' and indentation are required, or you'll get errors

# Example with ice cream flavors
ice_cream_flavors = [
    "Vanilla",
    "Chocolate",
    "Strawberry",
    "Mint Chocolate Chip"
]

for flavor in ice_cream_flavors:
    prompt = f"""For the ice cream flavor listed below, 
    provide a captivating description that could be used for promotional purposes.

    Flavor: {flavor}

    """
    print_llm_response(prompt)
# Output: Descriptions for each flavor printed

# Save descriptions to a list
promotional_descriptions = []
for flavor in ice_cream_flavors:
    prompt = f"""For the ice cream flavor listed below, 
    provide a captivating description that could be used for promotional purposes.

    Flavor: {flavor}

    """
    description = get_llm_response(prompt)
    promotional_descriptions.append(description)

print(promotional_descriptions)
# Output: List of descriptions for each flavor