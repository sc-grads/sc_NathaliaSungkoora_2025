#MYLIB.py file

from libs.operations import operator

print("mylib.py:", __name__)

#Can do relative IMPORTS from file with parent package

from .operations import operator