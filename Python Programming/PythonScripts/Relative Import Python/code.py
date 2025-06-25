#Code.py file

import mymodule

print("code.py:", __name__)

#CANNOT do relative imports from the __main__ file:

# from . import mymodule

#OUTPUT:
# operator.py libs.operations.operator
# mylib.py: libs.mylib
# mymodule.py: mymodule
# code.py: __main__