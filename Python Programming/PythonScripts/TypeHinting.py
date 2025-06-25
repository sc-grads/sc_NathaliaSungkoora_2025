#TYPE HINTING

#EXAMPLES

def list_avg(sequence: list) -> float: #HINT: list and expects a float
    return sum(sequence) / len(sequence)


#TYPE HINTING CLASSES IN PYCHARM

class Book:  #SPECIFYING NAME SHOULD BE STRING ANF PAGE COUNT SHOULD BE AN INTEGER
    def __init__(self, name: str, page_count: int):
        self.name = name
        self.page_count = page_count

#LISTS AND COLLECTIONS
#Using TYPE hinting

from typing import List  # Import List for type hinting (e.g., List[Book])

class Book:  # Given that a class BOOK exists
    pass

class BookShelf:
    def __init__(self, books: List[Book]):  # SPECIFY it should be a LIST of Book objects
        self.books = books  # Store the list in the object

    def __str__(self) -> str:  # SPECIFY that this method returns a STRING
        return f"BookShelf with {len(self.books)} books."  # Return how many books are on the shelf



#ANOTHER EXAMPLE:
#Hinting the CURRENT OBJECT


class Book:
    TYPES = ("hardcover", "paperback")
                #HINT: SPECIFY WHETHER IT SHOULD BE A STRING AND INT
    def __init__(self, name: str, book_type: str, weight: int):
        self.name = name
        self.book_type = book_type
        self.weight = weight

    def __repr__(self) -> str: #RETURNS A STRING
        return f"<Book {self.name}, {self.book_type}, weighing {self.weight}g>"

    @classmethod       #HINT: SPECIFY WHETHER IT SHOULD BE A STRING AND INT
    def hardcover(cls, name: str, page_weight: int) -> "Book": #RETURNS A BOOK OBJECT OF THE SAME TYPE
        return cls(name, cls.TYPES[0], page_weight + 100)

    @classmethod        #HINT: SPECIFY WHETHER IT SHOULD BE A STRING AND INT
    def paperback(cls, name: str, page_weight: int) -> "Book": #RETURNS A BOOK OBJECT OF THE SAME TYPE
        return cls(name, cls.TYPES[1], page_weight)
