#CUSTOME ERROR CLASSES

#Showing example where error can occur:
class Book:
    def __init__(self, name: str, page_count: int):
        self.name = name
        self.page_count = page_count
        self.pages_read = 0

    def __repr__(self):
        return (
            f"<Book {self.name}, read {self.pages_read} pages out of {self.page_count}>"
        )

    def read(self, pages: int):
        self.pages_read += pages
        print(f"You have now read {self.pages_read} pages out of {self.page_count}")


python101 = Book("Python 101", 50)
python101.read(35) #OUTPUT= You have now read 35 pages out of 50
python101.read(50) #OUTPUT= You have now read 85 pages out of 50 (does not make sense)
                            #Add an error to prevent this from happening

# ADDING A CUSTOM ERROR

#Include CUSTOM ERROR on top
# ERROR is inherited from a VALUE ERROR
class TooManyPagesReadError(ValueError):
    pass


class Book:
    def __init__(self, name: str, page_count: int):
        self.name = name
        self.page_count = page_count
        self.pages_read = 0

    def __repr__(self):
        return (
            f"<Book {self.name}, read {self.pages_read} pages out of {self.page_count}>"
        )

    def read(self, pages: int):
        if self.pages_read + pages > self.page_count:
            raise TooManyPagesReadError(  #CUSTOM ERROR ADDED WITH CUSTOM SPECIFIC NAME
                f"You tried to read {self.pages_read + pages} pages, but this book only has {self.page_count} pages."
            )
        self.pages_read += pages
        print(f"You have now read {self.pages_read} pages out of {self.page_count}")


python101 = Book("Python 101", 50)
python101.read(35) #OUTPUT = You have now read 35 pages out of 50
python101.read(50) #OUTPUT = TooManyPagesReadError: You tried to read 85 pages, but this book only has 50 pages.
                    #ERROR MESSAGE  is readable, easy to understand and helpful