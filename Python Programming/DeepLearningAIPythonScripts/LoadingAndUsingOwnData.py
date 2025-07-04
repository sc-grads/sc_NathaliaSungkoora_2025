# ==========================================
# Lesson 2: Loading and Using Your Own Data
# ==========================================

# Import helper functions
from helper_functions import upload_txt_file, list_files_in_directory, print_llm_response

# ==========================================
# Step 1: List Files in the Current Directory
# ==========================================
print("Files in current directory:\n")
list_files_in_directory()
# Output snippet:
# Lesson_2.ipynb
# email.txt
# helper_functions.py
# recipe.txt

# ==========================================
# Step 2: Open and Print Contents of email.txt
# ==========================================
f = open("email.txt", "r")
email = f.read()
f.close()

print("\nContents of email.txt:\n")
print(email)
# Output snippet:
# Subject: My Incredible Journey Around the World!
# ...
# Best,
# Daniel

# ==========================================
# Step 3: Open and Print Contents of recipe.txt
# ==========================================
f = open("recipe.txt", "r")
recipe = f.read()
f.close()

print("\nContents of recipe.txt:\n")
print(recipe)
# Output snippet:
# Kimchi Recipe
# To make kimchi, start by chopping one Napa cabbage...
# ...store the kimchi in the refrigerator. Enjoy!

# ==========================================
# Step 4: Upload Your Own Text File
# ==========================================
upload_txt_file()
#Manually upload a text file (e.g., "Sun City.txt") using the upload function.
# After uploading, run the next block to verify upload.

# ==========================================
# Step 5: Re-List Files After Upload
# ==========================================
print("\nFiles after upload:\n")
list_files_in_directory()
# Output snippet (example):
# Lesson_2.ipynb
# email.txt
# helper_functions.py
# recipe.txt
# Sun City.txt

# ==========================================
# Step 6: Open and Print Contents of Uploaded File
# ==========================================
# IMPORTANT: Change file name to match what you uploaded!
f = open("Sun City.txt", "r")
your_file_content = f.read()
f.close()

print("\nContents of uploaded file:\n")
print(your_file_content)
# Output snippet:
# Sun City (North West, South Africa) is a luxury resort...
# ...surrounded by natural beauty and wildlife.



# ==========================================
# Extra Practice: Lesson 2
# ==========================================

# ==========================================
# Exercise 1: Ask a New Question About Uploaded File
# ==========================================
# You can change the prompt to ask something different, like describing the location or giving a summary

prompt = f"""Create a list of key activities to do. 

Text:
{your_file_content}"""

print_llm_response(prompt)
# Output snippet:
# 1. Visit the casinos
# 2. Stay at luxury hotels
# 3. Play golf at the golf courses
# 4. Enjoy the Valley of Waves water park
# 5. Explore Pilanesberg National Park
# 6. Participate in family-friendly activities
# 7. Experience wildlife tours
# 8. Relax at spa facilities
# 9. Dine at various restaurants
# 10. Attend entertainment shows and events

# ==========================================
# Exercise 2: Analyze Recipe Text
# ==========================================
# This uses the 'recipe' variable loaded earlier from recipe.txt

prompt = f"""Identify all of the cooking techniques used in the 
following recipe:

Recipe:
{recipe}"""

print_llm_response(prompt)
# Output snippet:
# 1. Chopping
# 2. Salting
# 3. Rinsing
# 4. Mixing
# 5. Julienning
# 6. Packing
# 7. Fermenting
# 8. Storing

