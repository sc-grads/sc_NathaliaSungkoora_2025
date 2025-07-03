#WORKING WITH FILES AI

from helper_functions import *

# Function to read a journal entry from a file
journal = read_journal("journal_entries/cape_town.txt") 
print(journal)

#OUTPUT Example:
#Embarking on a gastronomic journey through Cape Town revealed a city brimming with culinary treasures.
#Each stop was a testament to the rich flavors and unique dishes that define this vibrant city's food scene.

# Function to get a response from the LLM
prompt = f"""
Given the following journal entry from a food critic, identify the restaurants and their specialties.
For each restaurant, highlight its name and specialties in bold and use different colors for each.
Provide the output as HTML suitable for display in a Jupyter notebook.

Journal entry:
{journal}
"""
html_response = get_llm_response(prompt)
display_html(html_response)

#OUTPUT Example:
#RESPONSE IN HTML FORMAT
#<div style="color: blue;"><strong>Restaurant A</strong>: Specializes in seafood dishes,
#  particularly their grilled calamari.</div>