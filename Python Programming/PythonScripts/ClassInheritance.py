# CLASS INHERITANCE


class Device:
    def __init__(self, name, connected_by):
        self.name = name
        self.connected_by = connected_by
        self.connected = True

    def __str__(self):
        return f"Device {self.name!r} ({self.connected_by})"
                        #!R: Adds qoutes to make it more readable
    def disconnect(self):
        self.connected = False
        print("Disconnected")

# printer = Device("Printer", "USB")
# print(printer)
# printer.disconnect()
#OUTPUT = #Device 'Printer' (USB)
          #Disconnected

# INHERITANCE

class Printer(Device): #CREATES A NEW CLASS THAT INHERITS FROM DEVICE
    def __init__(self, name, connected_by, capacity):
        # super(Printer, self).__init__(name, connected_by)  - Python2.7
        super().__init__(name, connected_by)  # Python3+
        self.capacity = capacity
        self.remaining_pages = capacity

    def __str__(self):
        return f"{super().__str__()} ({self.remaining_pages} pages remaining)"

    def print(self, pages):
        if not self.connected:
            print("Your printer is not connected!")
            return
        print(f"Printing {pages} pages.")
        self.remaining_pages -= pages


printer = Printer("Printer", "USB", 500)
printer.print(20)           #OUTPUT= Printing 20 pages.
print(printer)              #OUTPUT=  Device 'Printer' (USB) (480 pages remaining)
#More test:
printer.print(50)           #OUTPUT= Printing 50 pages.
print(printer)              #OUTPUT= Device 'Printer' (USB) (430 pages remaining)
printer.disconnect()        #OUTPUT= Disconnected
printer.print(30)           #OUTPUT= Your printer is not connected!