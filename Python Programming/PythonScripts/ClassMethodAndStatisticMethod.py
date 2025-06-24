#CLASS METHOD AND STATISTIC METHOD

class ClassTest:
    def instance_method(self):
        print(f"Called instance_method of {self}")
        # self means it's tied to an object (instance)

    @classmethod
    def class_method(cls):
        print(f"Called class_method of {cls}")
        # OUTPUT = Called class_method of <class '__main__.ClassTest'>
        # cls refers to the class, not the object

    @staticmethod  # seperate function that lives inside class
    # USED to Place a method inside a class
    def static_method():
        print(f"Called static_method. We don't get any object or class info here.")
        # OUTPUT = Called static_method. We don't get any object or class info here.
        # Works like a normal function, just inside a class

# calling class method of that class
ClassTest.class_method()  # Calls method using the class, not an object
ClassTest.static_method()  # Calls static method (no self or cls needed)


#Another Example:
#class Book:
#   TYPES = ("hardcover", "paperback")

#print(Book.TYPES) #OUTPUT = ('hardcover', 'paperback')

####
# EXAMPLE
#TESTING FLOW:
# Book:
#   TYPES = ("hardcover", "paperback")

#   def __init__(self, name, book_type, weight):
#        self.name = name
#        self.book_type = book_type
#        self.weight = weight

#book =Book("Harry Potter", "hardcover", 1500)
#print(book.name) #OUTPUT= Harry Potter


# EXAMPLE CONTINUED
## ADD __REPR__ RECREATE OBJECT IF NEEDED
#
# class Book:
#     TYPES = ("hardcover", "paperback")
#
#     def __init__(self, name, book_type, weight):
#         self.name = name
#         self.book_type = book_type
#         self.weight = weight
#
#     def __repr__(self):
#         return f"<Book {self.name}, {self.book_type}, weighing {self.weight}g>"
#
# book = Book("Harry Potter", "hardcover", 1500)
# print(book)  # OUTPUT = <Book Harry Potter, hardcover, weighing 1500g>

# FULL EXAMPLE AFTER ADDITIONS @CLASSMETHOD
class Book:
    TYPES = ("hardcover", "paperback")  # Available book types (shared by all books)

    def __init__(self, name, book_type, weight):
        self.name = name                # Book title
        self.book_type = book_type      # Either "hardcover" or "paperback"
        self.weight = weight            # Book weight in grams

    def __repr__(self):
        # Returns a readable string when printing the book object
        return f"<Book {self.name}, {self.book_type}, weighing {self.weight}g>"

    @classmethod
    def hardcover(cls, name, page_weight):
        # Creates a hardcover book and adds 100g for the cover
        return cls(name, cls.TYPES[0], page_weight + 100)

    @classmethod
    def paperback(cls, name, page_weight): #USE CLS instead of BOOK
        # Creates a paperback book with no extra weight
        return cls(name, cls.TYPES[1], page_weight)

# Create a hardcover book
heavy = Book.hardcover("Harry Potter", 1500)
# Create a paperback book
light = Book.paperback("Python 101", 600)

# Print the books
print(heavy)  # OUTPUT = <Book Harry Potter, hardcover, weighing 1600g>
print(light)  # OUTPUT = <Book Python 101, paperback, weighing 600g>


