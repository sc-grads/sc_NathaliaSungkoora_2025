# THE AT SYNTAX FOR DECORATORS

user = {"username": "jose", "access_level": "guest"}


def make_secure(func):
    def secure_function():
        if user["access_level"] == "admin":
            return func()
        else:
            return f"No admin permissions for {user['username']}."

    return secure_function

# This function is now protected by the make_secure decorator
@make_secure
def get_admin_password():
    return "1234"
print(get_admin_password())
#OUTPUT (if admin) =1234
#OUTPUT (if guest) = No admin permissions for jose.

####
#SECURE FUNCTION Example Using a DECORATOR
import functools  # Imports a module to help preserve function info when using decorators

user = {"username": "jose", "access_level": "admin"}  # A user dictionary with access level

# This is a decorator function to make other functions secure
def make_secure(func):
    @functools.wraps(func)  # Keeps original function name and docstring
    def secure_function():
        if user["access_level"] == "admin":  # Checks if user is admin
            return func()  # Runs the original function
        else:
            return f"No admin permissions for {user['username']}."  # Access denied message

    return secure_function  # Returns the new secure version of the function

# This function is now protected by the make_secure decorator
@make_secure
def get_admin_password():
    return "1234"  # Returns the admin password

print(get_admin_password())
# #OUTPUT (if admin) =1234
# #OUTPUT (if guest) = No admin permissions for jose.
print(get_admin_password.__name__)
# #OUTPUT (logs) =get_admin_password