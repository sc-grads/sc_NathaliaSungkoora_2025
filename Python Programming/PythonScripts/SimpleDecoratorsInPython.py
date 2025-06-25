#SIMPLE DECORATORS IN PYTHON

user = {"username": "jose", "access_level": "guest"}


def get_admin_password():
    return "1234"  # Returns the admin password


#SECURING PASSWORD: only shows password if you are admin
def secure_get_admin():
    if user["access_level"] == "admin":  # Check if user is admin
        print(get_admin_password())      # Print password only if admin


print(get_admin_password())  # The function itself is still unsecured
# OUTPUT= 1234

print(secure_get_admin())    # Won't print password because user is not admin
# OUTPUT= None

USING SECURE FUNCTION
user = {"username": "jose", "access_level": "guest"}

def get_admin_password():
    return "1234"  # Returns the admin password


def secure_function(func):
    if user["access_level"] == "admin":
        return func

get_admin_password = secure_function(get_admin_password())
print(get_admin_password())  # The function itself is still unsecured
# OUTPUT= if admin prints 1234 if guest prints None



#MODIFIED TO BE MORE SECURE
user = {"username": "jose", "access_level": "guest"}

def get_admin_password():
     return "1234"  # Returns the admin password

def make_secure(func):
    def secure_function():
        if user["access_level"] == "admin":
            return func()

    return secure_function

get_admin_password = make_secure(get_admin_password)
print(get_admin_password()) # OUTPUT= None


user = {"username": "jose", "access_level": "admin"}

def get_admin_password():
     return "1234"  # Returns the admin password

def make_secure(func):
    def secure_function():
        if user["access_level"] == "admin":
            return func()

    return secure_function

get_admin_password = make_secure(get_admin_password)
print(get_admin_password()) # OUTPUT= 1234


#CAN ADD ERROR HANDLING

def get_admin_password():
    return "1234"


def make_secure(func):
    def secure_function():
        if user["access_level"] == "admin":
            return func()
        else:
            return f"No admin permissions for {user['username']}."

    return secure_function


get_admin_password = make_secure(
    get_admin_password
)  # `get_admin_password` is now `secure_func` from above

user = {"username": "jose", "access_level": "guest"}
print(get_admin_password())  #OUTPUT= No admin permissions for jose.

user = {"username": "bob", "access_level": "admin"}
print(get_admin_password())  # OUTPUT= 1234