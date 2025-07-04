#EXTRACTING IMPORTANT INFORMATION FROM JOURNAL ENTRIES
# This script extracts restaurant and dish information from a food critic's journal entry.
from helper_functions import read_journal, get_llm_response, print_llm_response
from IPython.display import display, HTML

# STEP 1: Load the Rio de Janeiro journal entry
journal_rio = read_journal("rio_de_janeiro.txt")

# STEP 2: Prompt to highlight restaurants and dishes in color-coded HTML
prompt_highlight = f"""
Given the following journal entry from a food critic, identify the restaurants and their best dishes.
Highlight and bold each restaurant (in orange) and best dish (in blue) within the original text.

Provide the output as HTML suitable for display in a Jupyter notebook.

Journal entry:
{journal_rio}
"""

# STEP 3: Get the LLM response with HTML-formatted highlights
html_response = get_llm_response(prompt_highlight)

# STEP 4: Display the HTML-formatted journal entry
display(HTML(html_response))

# STEP 5: Save the HTML response to a file
with open("highlighted_text.html", 'w') as f:
    f.write(html_response)

# STEP 6: Prompt to extract restaurant and dish in CSV format
prompt_csv = f"""Please extract a comprehensive list of the restaurants 
and their respective best dishes mentioned in the following journal entry. 

Ensure that each restaurant name is accurately identified and listed. 
Provide your answer in CSV format, ready to save.
Exclude the "```csv" declaration, don't add spaces after the comma, include column headers.

Format:
Restaurant,Dish
Res_1,Dsh_1
...

Journal entry:
{journal_rio}
"""

# STEP 7: Get and print the CSV-ready response
restaurants_csv = get_llm_response(prompt_csv)
print(restaurants_csv)

# STEP 8: Loop through multiple journal files and extract restaurant/dish pairs
files = ["cape_town.txt", "istanbul.txt", "new_york.txt", "paris.txt", 
         "rio_de_janeiro.txt", "sydney.txt", "tokyo.txt"]

for file in files:
    journal_entry = read_journal(file)
    prompt_loop = f"""Please extract a comprehensive list of the restaurants 
and their respective best dishes mentioned in the following journal entry.

Ensure that each restaurant name is accurately identified and listed.
Provide your answer in CSV format, ready to save.
Exclude the "```csv" declaration, don't add spaces after the comma, include column headers.

Format:
Restaurant,Dish
Res_1,Dsh_1
...

Journal entry:
{journal_entry}
"""
    print(file)
    print_llm_response(prompt_loop)
    print("")  # Print blank line between results

#------------------------------------------------------------------------------------------------

#EXTRA PRACTICE:

#EXERCISE 1: 
# Modify the prompt below to create an HTML file that highlights all the restaurant names in green
# and the neighborhoods in pink in the Sydney journal entry.
journal_sydney = read_journal("sydney.txt") 

# Modify the prompt below
prompt = f"""
Given the following journal entry from a food critic, identify the 
restaurants and their best dishes. Highlight and bold each restaurant 
name (in green) and neighbourhoods(in pink) within the original text. 

Provide the output as HTML suitable for display in a Jupyter notebook. 

Journal entry:
{journal_sydney}
"""

html_sydney = get_llm_response(prompt)
display(HTML(html_sydney))

#Exercise 2
# Modify the code below to save the output of the LLM to an HTML file.
# The file should be called highlighted_sydney.html

# Save the HTML response to a file
f = open("highlighted_sydney.html", "w") 
f.write(html_response) 
f.close()
#Download the file
download_file()