#THIRD-PARTY PACKAGES FOR DATA EXPLORATION AND VISUALIZATION
# Demonstrates using third-party packages Pandas and Matplotlib for data exploration and visualization

# --- Pandas for Data Exploration ---
# Import pandas with alias for convenience
import pandas as pd

# Load car sales data from CSV
data = pd.read_csv('car_data.csv')
print(data)
# Output:      Model                Price  Year  Kilometer
#         0    Honda Amaze 1.2 VX i-VTEC  5050.00  2017  87150
#         1    Honda Brio V MT           3510.00  2014  39276
#         ... (158 rows x 4 columns)

# Filter cars with price >= 10000
print(data[data["Price"] >= 10000])
# Output:      Model                         Price  Year  Kilometer
#         21   Honda City V                 10600.0  2019  12382
#         30   Honda City ZX CVT Petrol     17000.0  2022   8530
#         ... (15 rows)

# Filter cars from 2015
filtered_data = data[data["Year"] == 2015]
print(filtered_data)
# Output:      Model                         Price  Year  Kilometer
#         20   Honda Mobilio S Diesel       4750.0  2015  72000
#         24   Honda Jazz V AT Petrol       5450.0  2015  42000
#         ... (18 rows)

# Calculate median price for 2015 cars
print(filtered_data["Price"].median())
# Output: 5475.0

# --- Matplotlib for Data Visualization ---
# Import matplotlib.pyplot with alias
import matplotlib.pyplot as plt

# Create scatter plot of price vs. kilometers
plt.scatter(data["Kilometer"], data["Price"])
plt.title('Car Price vs. Kilometers Driven')
plt.xlabel('Kilometers Driven')
plt.ylabel('Price (in USD)')
plt.show()
# Output: [Scatter plot of price vs. kilometers]

# Customized scatter plot with red color, grid, and larger title
plt.scatter(data["Kilometer"], data["Price"], color='red')
plt.title('Car Price vs. Kilometers Driven', fontsize=16)
plt.xlabel('Kilometers Driven')
plt.ylabel('Price (in USD)')
plt.grid(True)
plt.show()
# Output: [Red scatter plot with grid and larger title]

# --- Using Helper Function (Simulated) ---
# Import helper function (assumes helper_functions.py exists)
from helper_functions import get_llm_response

# Simulate chatbot response for pandas 'as' alias
prompt = "What does 'as' in 'import pandas as pd' do?"
response = get_llm_response(prompt)
print(response)
# Output: The 'as' keyword creates an alias, allowing 'pd' to be used instead of 'pandas' for brevity.

# Simulate chatbot response for filtering cars
prompt = """I have loaded data using: data = pd.read_csv('car_data.csv')
Show only the cars with a price greater than or equal to 10000."""
response = get_llm_response(prompt)
print(response)
# Output: print(data[data["Price"] >= 10000])