#DECORATING FUNCTIONS WITH PARAMETERS

import functools

user = {"username": "jose", "access_level": "admin"}

def make_secure(func):
    @functools.wraps(func)  # Keep original function's info (name, docstring)
    def secure_function(*args, **kwargs):  # Accept any arguments the original function needs
        if user["access_level"] == "admin":  # Check if user is admin
            return func(*args, **kwargs)  # Run original function with all arguments
        else:
            return f"No admin permissions for {user['username']}."  # Deny access if not admin
    return secure_function  # Return the wrapped function

@make_secure  # Decorate get_password with security check
def get_password(panel):
    if panel == "admin":
        return "1234"
    elif panel == "billing":
        return "super_secure_password"

print(get_password("admin"))    # Calls wrapped function
# OUTPUT(guest)= No admin permissions for jose.
# OUTPUT(admin)= 1234

print(get_password("billing"))  # Calls wrapped function
# OUTPUT= No admin permissions for jose.
# OUTPUT= super_secure_password

