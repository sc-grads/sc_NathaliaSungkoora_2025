#Mymodule.py file
from libs import mylib

print("mymodule.py:", __name__)

#CANNOT do relative imports from top-level file

from .libs import mylib

#PARENT IMPORTS

import libs.operations.operator