#HELPER FUNCTIONS

# Defines helper functions and demonstrates importing them

# --- Function Definitions ---
def fahrenheit_to_celsius(fahrenheit):
    # Convert Fahrenheit to Celsius and print result
    celsius = (fahrenheit - 32) * 5 / 9
    print(f"{fahrenheit}°F is equivalent to {celsius:.2f}°C")
    # Output: 68°F is equivalent to 20.00°C (when called with 68)

def celsius_to_fahrenheit(celsius):
    # Convert Celsius to Fahrenheit and print result
    fahrenheit = (celsius * 9 / 5) + 32
    print(f"{celsius}°C is equivalent to {fahrenheit:.2f}°F")
    # Output: 20°C is equivalent to 68.00°F (when called with 20)

def print_llm_response(prompt):
    # Simulate printing an LLM response
    print(f"Simulated LLM response: {prompt}")
    # Output: Simulated LLM response: What is the capital of France? (when called)

def get_llm_response(prompt):
    # Simulate returning an LLM response
    if prompt == "What is the capital of France?":
        return "The capital of France is Paris."
    elif prompt == "Give me three tips to become a good learner.":
        return """1. Set Clear Goals: Define specific objectives.
2. Practice Active Learning: Engage through practice.
3. Reflect and Adapt: Adjust methods based on progress."""
    return "Unknown prompt"
    # Output: The capital of France is Paris. (when called)

# --- Demonstrating Imports ---
# Specific import
from helper_functions_demo import celsius_to_fahrenheit
celsius_to_fahrenheit(20)
# Output: 20°C is equivalent to 68.00°F

# Module import
import helper_functions_demo
helper_functions_demo.fahrenheit_to_celsius(68)
# Output: 68°F is equivalent to 20.00°C

# Wildcard import (not recommended)
from helper_functions_demo import *
print_llm_response("What is the capital of France?")
# Output: Simulated LLM response: What is the capital of France?

response = get_llm_response("Give me three tips to become a good learner.")
print(response)
# Output: 1. Set Clear Goals: Define specific objectives.
#         2. Practice Active Learning: Engage through practice.
#         3. Reflect and Adapt: Adjust methods based on progress.