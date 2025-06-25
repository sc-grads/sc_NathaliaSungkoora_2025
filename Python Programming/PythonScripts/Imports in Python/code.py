#IMPORTING
#Ensure file name is code.py
#References Imports.py

#Importing from this file to the Imports.py file
from Imports import divide

print(divide(10, 2))

#OUTPUT (When run from this file):
# Imports.py: Imports
# 5.0

#Example of an import from a folder
import Imports

print("Imports.py: ", __name__)

import sys

print(sys.modules)