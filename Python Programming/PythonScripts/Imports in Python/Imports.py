#IMPORTS
#Ensure file name is Imports.py
#References code(imports).py
def divide(dividend, divisor):
    return dividend / divisor


print("Imports.py:", __name__)
# Python will name this according to its path
#OUTPUT: Imports.py: __main__


import sys
print(sys.path)
#Prints specific file path
#Output Example: ['C:\\Users\\NathaliaSungkoora\\PycharmProjects\\PythonProject\\Imports in Python']

#Imporing from a folder (mylib)

import libs.mylib
int("Imports.py:", __name__)


