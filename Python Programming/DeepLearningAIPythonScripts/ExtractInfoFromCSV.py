#EXTRACT INFORMATION FROM A CSV FILE TO A TABLE 



#------------------------------------------------------------------------------------------------------
#LOADING THE DATA FROM A CSV FILE 
# Importing necessary modules
from helper_functions import get_llm_response, print_llm_response, display_table
from IPython.display import Markdown
import csv

# Loading data from itinerary.csv
f = open("itinerary.csv", 'r')
csv_reader = csv.DictReader(f)
itinerary = []

# Reading each row and storing in itinerary list
for row in csv_reader:
    print(row)  # Output: Prints each row as a dictionary
    itinerary.append(row)

# Output:
# {'Arrival': 'July-01', 'Departure': 'July-08', 'City': 'New York', 'Country': 'USA'}
# {'Arrival': 'July-09', 'Departure': 'July-16', 'City': 'Rio de Janeiro', 'Country': 'Brazil'}
# {'Arrival': 'July-17', 'Departure': 'July-24', 'City': 'Cape Town', 'Country': 'South Africa'}
# {'Arrival': 'July-25', 'Departure': 'August-01', 'City': 'Istanbul', 'Country': 'Turkey'}
# {'Arrival': 'August-02', 'Departure': 'August-09', 'City': 'Paris', 'Country': 'France'}
# {'Arrival': 'August-10', 'Departure': 'August-17', 'City': 'Tokyo', 'Country': 'Japan'}
# {'Arrival': 'August-18', 'Departure': 'August-25', 'City': 'Sydney', 'Country': 'Australia'}

# Closing the file
f.close()

# Displaying the entire itinerary
print(itinerary)
# Output: [{'Arrival': 'July-01', 'Departure': 'July-08', 'City': 'New York', 'Country': 'USA'}, ...]

# Checking the data type of itinerary
print(type(itinerary))
# Output: <class 'list'>

# Accessing the first item in the itinerary
print(itinerary[0])
# Output: {'Arrival': 'July-01', 'Departure': 'July-08', 'City': 'New York', 'Country': 'USA'}

# Accessing a specific value from the first item
print(itinerary[0]["Country"])
# Output: USA

# Example: Exploring other rows and values
print(itinerary[1]["City"])  # Accessing the city from the second row
# Output: Rio de Janeiro
#------------------------------------------------------------------------------
#STRUCTURED DATA: EXTRACT INFORMATION FROM A CSV FILE TO A TABLE

#Display a table of itinerary information extracted from a CSV file
display_table(itinerary)


#FILTER DATA FROM THE TABLE
# Create an empty list to store the filtered data
filtered_data = []

# Filter by country
for trip_stop in itinerary:
    # For example: get the destinations located in "Japan"
    if trip_stop["Country"] == "Japan":
        filtered_data.append(trip_stop)

#Display the filtered data in a table format
display_table(filtered_data)        
#------------------------------------------------------------------------------
#USING AI TO SUGGEST TRIP ACTIVITIES 
from helper_functions import get_llm_response
from IPython.display import display, Markdown

# Example itinerary list with destinations
itinerary = [
    {"Arrival": "July-01", "Departure": "July-08", "City": "New York", "Country": "USA"},
    {"Arrival": "July-09", "Departure": "July-15", "City": "Paris", "Country": "France"},
    # You can add more stops here...
]

# Step 1: Select the first destination from the itinerary
trip_stop = itinerary[0]
print(trip_stop)

# Step 2: Extract individual pieces of information
city = trip_stop["City"]
country = trip_stop["Country"]
arrival = trip_stop["Arrival"]
departure = trip_stop["Departure"]

# Step 3: Create a prompt to ask the LLM for suggestions
prompt = f"""I will visit {city}, {country}, from {arrival} to {departure}. 
Please create a detailed daily itinerary."""

print(prompt)  # Optional: see the prompt text

# Step 4: Get the LLM response using the custom function
response = get_llm_response(prompt)

# Step 5: Display the response in Markdown format (pretty format in notebook)
display(Markdown(response))
