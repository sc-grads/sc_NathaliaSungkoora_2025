#DECPRATORS WITH PARAMETERS
import functools

user = {"username": "jose", "access_level": "user"}

# This is a decorator factory that takes an argument 'required_level'
def make_secure(required_level):
    # This is the actual decorator that takes the function to wrap
    def decorator(func):
        @functools.wraps(func)
        def secure_function(*args, **kwargs):
            if user["access_level"] == required_level:
                return func(*args, **kwargs)
            else:
                return f"No {required_level} permissions for {user['username']}."
        return secure_function
    return decorator  # Return the decorator

# Use the decorator with a parameter
@make_secure("admin")
def get_admin_password():
    return "admin: 1234"

@make_secure("user")
def get_dashboard_password():
    return "user: user_password"

print(get_admin_password())      # OUTPUT = No admin permissions for jose.
print(get_dashboard_password())  # OUTPUT = user: user_password


#TESTING WITH ADMIN as anna
import functools

user = {"username": "anna", "access_level": "admin"}

# This is a decorator factory that takes an argument 'required_level'
def make_secure(required_level):
    # This is the actual decorator that takes the function to wrap
    def decorator(func):
        @functools.wraps(func)
        def secure_function(*args, **kwargs):
            if user["access_level"] == required_level:
                return func(*args, **kwargs)
            else:
                return f"No {required_level} permissions for {user['username']}."
        return secure_function
    return decorator  # Return the decorator

# Use the decorator with a parameter
@make_secure("admin")
def get_admin_password():
    return "admin: 1234"

@make_secure("user")
def get_dashboard_password():
    return "user: user_password"

print(get_admin_password())      # OUTPUT = admin: 1234
print(get_dashboard_password())  # OUTPUT = No user permissions for anna.