#CLASS COMPOSITION

#Used much more as compared to Inheritance

#Difference:
# Inheritance: "A Book is a BookShelf"
# Composition: "A BookShelf has many Books"


class BookShelf:
    def __init__(self, *books):
        self.books = books

    def __str__(self):
        return f"BookShelf with {len(self.books)} books."


class Book:
    def __init__(self, name):
        self.name = name


book = Book("Harry Potter")
book2 = Book("Python 101")
shelf = BookShelf(book, book2)
print(shelf) #OUTPUT= BookShelf with 2 books.