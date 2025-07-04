#CREATE MULTIPLE ITINERARIES

# Creating Itineraries for Multiple Cities
# How to read CSV and text files to create detailed travel itineraries.

# Importing necessary modules
from helper_functions import print_llm_response, get_llm_response, display_table
from IPython.display import Markdown
import csv

# Defining function to read CSV file and return data as a list of dictionaries
def read_csv(file):
    f = open(file, "r")
    csv_reader = csv.DictReader(f)
    data = []
    for row in csv_reader:
        data.append(row)
    f.close()
    return data

# Reading and displaying itinerary from CSV
itinerary = read_csv("itinerary.csv")
display_table(itinerary)
# Snippet of Output: [{'Arrival': 'July-01', 'Departure': 'July-08', 'City': 'New York', 'Country': 'USA'}, ...]

# Defining function to read journal text file and return content as a string
def read_journal(journal_file):
    f = open(journal_file, "r")
    journal = f.read()
    f.close()
    return journal

# Reading and printing Sydney journal
journal = read_journal("sydney.txt")
print(journal)
# Snippet of Output: My culinary adventure began at Saint Peter, a renowned seafood restaurant...

# Creating prompt to extract restaurant and specialty dish information
prompt = f"""Please extract a comprehensive list of the restaurants 
and their respective specialties mentioned in the following journal entry. 
Ensure that each restaurant name is accurately identified and listed. 
Provide your answer in CSV format, ready to save. 
Exclude the "```csv" declaration, don't add spaces after the comma, include column headers.

Format:
Restaurant,Specialty
Res_1,Sp_1
...

Journal entry:
{journal}
"""
print_llm_response(prompt)
# Snippet of Output: Restaurant,Specialty\nSaint Peter,Murray Cod\n...

# Reading and displaying Sydney restaurant information
sydney_restaurants = read_csv("Sydney.csv")
display_table(sydney_restaurants)
# Snippet of Output: [{'Restaurant': 'Saint Peter', 'Specialty': 'Murray Cod'}, ...]

# Selecting Sydney from itinerary and preparing variables
trip_stop = itinerary[6]
city = trip_stop["City"]
country = trip_stop["Country"]
arrival = trip_stop["Arrival"]
departure = trip_stop["Departure"]
restaurants = sydney_restaurants

# Creating prompt for detailed Sydney itinerary
prompt = f"""I will visit {city}, {country} from {arrival} to {departure}. 
Create a daily itinerary with detailed activities. 
Designate times for breakfast, lunch, and dinner. 

I want to visit the restaurants listed in the restaurant dictionary 
without repeating any place. Make sure to mention the specialty
that I should try at each of them.

Restaurant dictionary:
{restaurants}
"""
response = get_llm_response(prompt)
display(Markdown(response))
# Snippet of Output: Sydney Itinerary: August 18 - August 25\nDay 1: August 18 (Saturday)\n...

# Creating detailed itineraries for all cities
detailed_itinerary = {}
for trip_stop in itinerary:
    city = trip_stop["City"]
    country = trip_stop["Country"]
    arrival = trip_stop["Arrival"]
    departure = trip_stop["Departure"]
    rest_dict = read_csv(f"{city}.csv")
    
    print(f"Creating detailed itinerary for {city}, {country}.")
    
    prompt = f"""I will visit {city}, {country} from {arrival} to {departure}. 
    Create a daily itinerary with detailed activities. 
    Designate times for breakfast, lunch, and dinner. 

    I want to visit the restaurants listed in the restaurant dictionary without repeating any place.
    Make sure to mention the specialty that I should try at each of them.

    Restaurant dictionary:
    {rest_dict}
    """
    detailed_itinerary[city] = get_llm_response(prompt)

# Displaying Tokyo itinerary
display(Markdown(detailed_itinerary["Tokyo"]))
# Snippet of Output: Tokyo Itinerary: August 10 - August 17\nDay 1: August 10 (Saturday)\n...

# Displaying Cape Town itinerary
display(Markdown(detailed_itinerary["Cape Town"]))
# Snippet of Output: Cape Town Itinerary: July 17 - July 24\nDay 1: July 17 (Monday)\n...